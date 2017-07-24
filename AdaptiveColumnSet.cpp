
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
		pe->SetLayout(NetUI::DLT_Horiz);
		pe->SetID(L"columnSet");
		pRootElement->AddElement(pe);

		AddColumn(pe);
		AddColumn(pe);
		AddColumn(pe);
	}
}

void AdaptiveColumnSet::AddColumn(NetUI::Element* pColumnSet)
{
	if (pColumnSet)
	{
		NetUI::Element* pe;
		NetUI::Element::Create(NetUI::EC_Normal, &pe);
		pe->SetLayout(NetUI::DLT_Vert);
		pe->SetID(L"column");
		pColumnSet->AddElement(pe);

		AddLabels(pe);
	}
}

void AdaptiveColumnSet::AddLabels(NetUI::Element* pColumn)
{
	if (pColumn)
	{
		for (int i = 0; i < 2; i++)
		{
			NetUI::Element* pe;
			NetUI::Label* pl;

			NetUI::Label::Create(&pe);
			pl = (NetUI::Label*)pe;

			pl->SetTextString(L"this is test string");

			pColumn->AddElement(pl);
		}
	}
}

void AdaptiveColumnSet::LayoutColumnSet(NetUI::Element* /*pRootElement*/)
{
}
