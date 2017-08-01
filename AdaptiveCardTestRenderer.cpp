#include "stdafx.h"

#include "AdaptiveCardTestRenderer.h"
#include "AdaptiveLabel.h"
#include "AdaptiveCardLayoutUtil.h"
#include "SharedAdaptiveCard.h"
#include "ColumnSet.h"
#include "AdaptiveColumnSet.h"

using namespace AdaptiveCards;
using namespace NetUI;

_Callback_ HRESULT NETUI_API LayoutAdaptiveLabel(Element *pe, void *)
{
	Assert(pe != nullptr);
	Assert(pe->IsElement());
	if (pe != nullptr && !pe->IsElement())
		return S_FALSE;

	AdaptiveLabel* pAdaptiveLabel = (AdaptiveLabel*) pe;
	
	pAdaptiveLabel->Layout();

	return NOERROR;
}

void AdaptiveCardTestRenderer::AddColumnSet()
{
	if (m_pRootElement)
	{
		std::shared_ptr<AdaptiveCard> sharedAdaptiveCard = AdaptiveCard::DeserializeFromFile(L"AdaptiveCard.json");

		for (auto & spElement : sharedAdaptiveCard->GetBody())
		{
			if (spElement->GetElementType() == CardElementType::ColumnSet)
			{
				Element* pe;
				AdaptiveColumnSet* pc;
				AdaptiveColumnSet::Create(&pe);
				pc = (AdaptiveColumnSet*) pe;

				m_pRootElement->AddElement(pc);
				pc->Populate(std::static_pointer_cast<ColumnSet>(spElement));
			}
		}
	}
}

void AdaptiveCardTestRenderer::Layout()
{
	if (m_pRootElement)
	{
		AutoDeferBlock adb;
		ULONG availableWidth = m_pRootElement->GetExtent().cx;
		LayoutAdaptiveColumnSets(m_pRootElement, availableWidth);
		// update wrap
		m_pRootElement->ForAllDescendentsOfType(L"AdaptiveLabel", LayoutAdaptiveLabel, nullptr);
	}
}

AdaptiveCardTestRenderer::AdaptiveCardTestRenderer(Element* pRootElement) : m_pRootElement(pRootElement)
{
	if (pRootElement)
	{
		// TODO : remove capturing "this", instead capture weak_ptr
		m_pAdaptiveCardElementListener = new AdaptiveCardElementListener([this]()
		{
			Layout();
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