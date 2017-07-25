
#include "stdafx.h"

#include "AdaptiveColumnSet.h"

AdaptiveColumnSet::AdaptiveColumnSet()
{
}

AdaptiveColumnSet::~AdaptiveColumnSet()
{
}

void AdaptiveColumnSet::AddColumnSet(NetUI::Element* pRootElement)
{
	if (pRootElement)
	{
		NetUI::Element* pe;
		NetUI::Element::Create(NetUI::EC_Normal, &pe);
		pe->SetLayout(NetUI::DLT_Table);
		pe->SetID(L"columnSet");
		pe->SetChildrenMargin(10);
		pe->SetColumns(3);
		pRootElement->AddElement(pe);

		AddColumn(pe, L"Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large", false);
		AddColumn(pe, L"Small Small");
		AddColumn(pe, L"Medium Medium Medium Medium Medium Medium Medium Medium");
	}
}

void AdaptiveColumnSet::AddColumn(NetUI::Element* pColumnSet, const std::wstring &label, bool setWrap)
{
	if (pColumnSet)
	{
		NetUI::Element* pe;
		NetUI::Element::Create(NetUI::EC_Normal, &pe);
		pe->SetLayout(NetUI::DLT_Vert);
		pe->SetID(L"column");
		pColumnSet->AddElement(pe);
		pe->SetExpandToFillHoriz(true);
		AddLabels(pe, label, setWrap);
	}
}

void AdaptiveColumnSet::AddLabels(NetUI::Element* pColumn, const std::wstring &label, bool setWrap)
{
	if (pColumn)
	{
		for (int i = 0; i < 3; i++)
		{
			NetUI::Element* pe;
			NetUI::Label* pl;

			NetUI::Columnset::Create(&pe);
			pl = (NetUI::Label*)pe;
			
			pl->SetWidthFlags(NetUI::WF_NOSHRINKWRAP | NetUI::WF_NOWIDERFORLONGWORD);
			pl->SetTextAlign(NetUI::CA_TopLeft);
			if (setWrap)
			{
				pl->SetTextAlign(NetUI::CA_WrapLeft | NetUI::CA_EndEllipsis);
			}
			pl->SetExpandToFillHoriz(true);
			pl->SetTextString(label.c_str());
			pColumn->AddElement(pl);
		}
	}
}

void AdaptiveColumnSet::LayoutColumnSet(NetUI::Element* /*pRootElement*/)
{
}
