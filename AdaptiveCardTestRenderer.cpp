#include "stdafx.h"

#include "AdaptiveCardTestRenderer.h"
#include "AdaptiveLabel.h"
#include "AdaptiveCardLayoutUtil.h"

void AdaptiveCardTestRenderer::AddColumnSet()
{
	if (m_pRootElement)
	{
		Element* pe;
		Element::Create(EC_Normal, &pe);
		pe->SetLayout(DLT_Table);
		pe->SetID(L"columnSet");
		pe->SetChildrenMargin(10);
		pe->SetColumns(3);
		m_pRootElement->AddElement(pe);

		AddColumn(pe, L"Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large Large", true);
		AddColumn(pe, L"Small Small");
		AddColumn(pe, L"Medium Medium Medium Medium Medium Medium Medium Medium");
	}
}

void AdaptiveCardTestRenderer::AddColumn(Element* pColumnSet, const std::wstring &label, bool setWrap)
{
	if (pColumnSet)
	{
		Element* pe;
		Element::Create(EC_Normal, &pe);
		pe->SetLayout(DLT_Vert);
		pe->SetID(L"column");
		pColumnSet->AddElement(pe);
		AddLabels(pe, label, setWrap);
	}
}

void AdaptiveCardTestRenderer::AddLabels(Element* pColumn, const std::wstring &label, bool setWrap)
{
	if (pColumn)
	{
		for (int i = 0; i < 3; i++)
		{
			Element* pe;
			AdaptiveLabel* pl;

			AdaptiveLabel::Create(&pe);
			pl = (AdaptiveLabel*) pe;
			pl->SetTextAlign(CA_Left);
			pl->SetWrapText(setWrap);
			pl->SetExpandToFillHoriz(true);
			pl->SetTextString(label.c_str());
			pColumn->AddElement(pl);
		}
	}
}

void AdaptiveCardTestRenderer::LayoutColumnSet()
{
	if (m_pRootElement)
	{
		AutoDeferBlock adb;
		ULONG availableWidth = m_pRootElement->GetExtent().cx;
		ForAllDescendentsWithId(m_pRootElement, L"columnSet", UpdateColumnLayout, &availableWidth);
	}
}

AdaptiveCardTestRenderer::AdaptiveCardTestRenderer(Element* pRootElement) : m_pRootElement(pRootElement)
{
	if (pRootElement)
	{
		// TODO : remove capturing "this", instead capture weak_ptr
		m_pAdaptiveCardElementListener = new AdaptiveCardElementListener([this]()
		{
			LayoutColumnSet();
		});
		pRootElement->AddListener(m_pAdaptiveCardElementListener);
	}
}

AdaptiveCardTestRenderer::~AdaptiveCardTestRenderer()
{
	if (m_pRootElement && m_pAdaptiveCardElementListener)
	{
		m_pRootElement->RemoveListener(m_pAdaptiveCardElementListener);
	}
}