-- Completed 03/16/2024 - Updated 03/28/24
local vC_AppName, vC_App = ...
if not ( vC_Run_AuctionSales ) then return end
-------------------------------------------------------
-- AuctionHouse Price Adjustments
-------------------------------------------------------
function MyAuctionHouse(AHType)
   local AHSF = AuctionatorSellingFrame.SaleItemFrame.Price.MoneyInput
   local AHSFGold = AHSF.GoldBox:GetNumber()
   local AHSFSilver = AHSF.SilverBox:GetNumber()
   local gold = 0
   
   --if AHType == 0 then
	--	if
	--		AHSFGold >= 1000 then gold = 700
		--elseif
		--	AHSFGold == 0 and AHSFSilver > 0 then gold = 1
	--	else
	--		gold = AHSFGold
	--	end
   --else
    --  gold = AHType
  -- end
   
   --AHSF.GoldBox:SetNumber(math.ceil(gold))
   
	AHSF.SilverBox:SetNumber(0)
	SlashCmdList["Auctionator"]("post")
	
   --if gold ~= 0 then SlashCmdList["Auctionator"]("post") else AuctionatorSkipPostingButton:Click() end
end
-------------------------------------------------------
-- Calculate Total of Sales & Auction House Frame
-------------------------------------------------------
function vC_AuctionHouse_Sales()
	if ( vC_AuctionSalesFrame == nil ) then
		local vC_AuctionSalesFrame = CreateFrame("Frame", "vC_AuctionSalesFrame", AuctionHouseFrame, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_AuctionSalesFrame, 16, 1)
			vC_AuctionSalesFrame:SetSize(300, 40)
			vC_AuctionSalesFrame:SetPoint("TOPRIGHT", AuctionHouseFrame, "TOPRIGHT", 2, 38)
				vC_NumberOfItemInBuyout = vC_AuctionSalesFrame:CreateFontString("vC_NumberOfItemInBuyout", "ARTWORK", vC_Font[216])
				vC_NumberOfItemInBuyout:SetPoint("TOPLEFT", vC_AuctionSalesFrame, 7, -6)
				vC_NumberOfItemInBuyout:SetText("0 Item(s) in Buyout:")
				vC_ItemInBuyoutAmount = vC_AuctionSalesFrame:CreateFontString("vC_ItemInBuyoutAmount", "ARTWORK", vC_Font[216])
				vC_ItemInBuyoutAmount:SetPoint("TOPRIGHT", vC_AuctionSalesFrame, -7, -6)
				vC_ItemInBuyoutAmount:SetText(vC_GoldFormat(0))
				vC_NumberOfItemSold = vC_AuctionSalesFrame:CreateFontString("vC_NumberOfItemSold", "ARTWORK", vC_Font[216])
				vC_NumberOfItemSold:SetPoint("BOTTOMLEFT", vC_AuctionSalesFrame, 7, 6)
				vC_NumberOfItemSold:SetText("0 Item(s) Sold for:")
				vC_ItemSoldTotalAmount = vC_AuctionSalesFrame:CreateFontString("vC_ItemSoldTotalAmount", "ARTWORK", vC_Font[216])
				vC_ItemSoldTotalAmount:SetPoint("BOTTOMRIGHT", vC_AuctionSalesFrame, -7, 6)
				vC_ItemSoldTotalAmount:SetText(vC_GoldFormat(0))
	end
	local TotalItems, AmountIncoming, NumberOfItemInBuyout, NumberOfItemSold = 0, 0, 0, 0
	for i = 1, C_AuctionHouse.GetNumOwnedAuctions() do
		NumberOfItemInBuyout = C_AuctionHouse.GetOwnedAuctionInfo(i).buyoutAmount
		TotalItems = TotalItems + NumberOfItemInBuyout
		if C_AuctionHouse.GetOwnedAuctionInfo(i).status == 1 then
			AmountIncoming = AmountIncoming + NumberOfItemInBuyout
			NumberOfItemSold = NumberOfItemSold + 1
		end
	end
	vC_NumberOfItemInBuyout:SetText(C_AuctionHouse.GetNumOwnedAuctions().." Item(s) in Buyout:")
	vC_ItemInBuyoutAmount:SetText(vC_GoldFormat(TotalItems))
	vC_NumberOfItemSold:SetText(NumberOfItemSold.." Item(s) Sold for:")
	vC_ItemSoldTotalAmount:SetText(vC_GoldFormat(AmountIncoming))
end
