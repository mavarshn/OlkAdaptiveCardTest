#include "stdafx.h"
#include "AdaptiveNetUIViewer.h"
#include "BaseCardElement.h"
#include "AdaptiveCardNetUIRenderer.h"
#include "AdaptiveLabel.h"
#include "AdaptiveCardLayoutUtil.h"

using namespace NetUI;
using namespace AdaptiveCards;

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

HRESULT AdaptiveNetUIViewer::RenderAdaptiveCardFromTextFile(NetUI::NUIDocument * nuiDocument)
{
	HRESULT hr = NOERROR;

	std::shared_ptr<AdaptiveCard> sharedAdaptiveCard = AdaptiveCard::DeserializeFromFile(L"AdaptiveCard.json");
	std::vector<std::shared_ptr<BaseCardElement>> cardBody = sharedAdaptiveCard->GetBody();

	NetUI::Element *peRoot = nuiDocument->GetRootElement();
	peRoot->DestroyAllChildren();

	AdaptiveCardNetUIRenderer::RegisterAdaptiveElements();

	for (auto it = cardBody.begin(); it != cardBody.end(); ++it)
	{
		Element* pe;
		hr = AdaptiveCardNetUIRenderer::HrCreateAdaptiveElement(*it, &pe);

		if (!FAILED(hr))
		{
			peRoot->AddElement(pe);
		}
	}

	ULONG availableWidth = peRoot->GetExtent().cx;
	LayoutAdaptiveColumnSets(peRoot, availableWidth);
	// update wrap
	peRoot->ForAllDescendentsOfType(L"AdaptiveLabel", LayoutAdaptiveLabel, nullptr);

	return hr;
}