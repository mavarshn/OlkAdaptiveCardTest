#include "stdafx.h"
#include "AdaptiveCardNetUIRenderer.h"
#include "AdaptiveLabel.h"
#include "AdaptiveColumn.h"
#include "AdaptiveColumnSet.h"
#include <codecvt>

using namespace NetUI;
using namespace AdaptiveCards;

void AdaptiveCardNetUIRenderer::RegisterAdaptiveElements()
{
	AdaptiveLabel::Register();
	AdaptiveColumn::Register();
	AdaptiveColumnSet::Register();
}

HRESULT AdaptiveCardNetUIRenderer::HrCreateAdaptiveElement(const std::shared_ptr<BaseCardElement>& spCardElement, Element ** ppElement)
{
	HRESULT hr = NOERROR;

	if (spCardElement == nullptr)
	{
		return E_INVALIDARG;
	}

	switch (spCardElement->GetElementType())
	{
		case CardElementType::TextBlock:
		{
			AdaptiveLabel* pAdaptiveLabel;
			hr = HrCreateAdaptiveElement(&pAdaptiveLabel, spCardElement);
			*ppElement = pAdaptiveLabel;
			break;
		}

		case CardElementType::ColumnSet:
		{
			AdaptiveColumnSet* pAdaptiveColumnSet;
			hr = HrCreateAdaptiveElement(&pAdaptiveColumnSet, spCardElement);
			*ppElement = pAdaptiveColumnSet;
			break;
		}

		case CardElementType::Column:
		{
			AdaptiveColumn* pAdaptiveColumn;
			hr = HrCreateAdaptiveElement(&pAdaptiveColumn, spCardElement);
			*ppElement = pAdaptiveColumn;
			break;
		}

		default:
			return E_FAIL;
	}

	return hr;
}
