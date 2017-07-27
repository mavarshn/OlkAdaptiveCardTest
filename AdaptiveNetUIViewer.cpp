#include "stdafx.h"
#include "AdaptiveNetUIViewer.h"
#include "TextBlock.h"
#include "BaseCardElement.h"
#include "AdaptiveCardNetUIRenderer.h"


AdaptiveNetUIViewer::AdaptiveNetUIViewer()
{
}


AdaptiveNetUIViewer::~AdaptiveNetUIViewer()
{
}


HRESULT AdaptiveNetUIViewer::RenderAdaptiveCardFromTextFile(NetUI::NUIDocument * nuiDocument)
{
	NetUI::Element * card;
	std::ifstream ifs("card.txt");
	std::string jsonCard((std::istreambuf_iterator<char>(ifs)),
		(std::istreambuf_iterator<char>()));

	std::shared_ptr<::AdaptiveCards::AdaptiveCard> sharedAdaptiveCard = ::AdaptiveCards::AdaptiveCard::DeserializeFromString(jsonCard);

	std::vector<std::shared_ptr<AdaptiveCards::BaseCardElement>> cardBody = sharedAdaptiveCard->GetBody();

	for (auto it = cardBody.begin(); it != cardBody.end(); ++it)
	{
		if ((*it)->GetElementType() == AdaptiveCards::CardElementType::TextBlock)
		{
			AdaptiveCardNetUIRenderer renderer;
			HRESULT hr = renderer.BuildTextBlock((AdaptiveCards::TextBlock&)(**it), &card);
			NetUI::Element *peRoot = nuiDocument->GetRootElement();
			peRoot->DestroyAllChildren();
			peRoot->AddElement(card);

			return hr;
		}
	}

	return S_OK;
}