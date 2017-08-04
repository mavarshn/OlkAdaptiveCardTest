#include "stdafx.h"
#include "AdaptiveCardNetUIRenderer.h"
#include "AdaptiveLabel.h"
#include "AdaptiveColumn.h"
#include "AdaptiveColumnSet.h"
#include "AdaptiveContainer.h"
#include "AdaptiveFactSet.h"
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

		case CardElementType::Container:
		{
			AdaptiveContainer* pAdaptiveContainer;
			hr = HrCreateAdaptiveElement(&pAdaptiveContainer, spCardElement);
			*ppElement = pAdaptiveContainer;
			break;
		}

		case CardElementType::FactSet:
		{
			AdaptiveFactSet* pAdaptiveFactSet;
			hr = HrCreateAdaptiveElement(&pAdaptiveFactSet, spCardElement);
			*ppElement = pAdaptiveFactSet;
			break;
		}

		default:
			return E_FAIL;
	}

	return hr;
}
