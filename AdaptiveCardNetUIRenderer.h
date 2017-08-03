#pragma once

#include <nuielement.h>
#include "BaseCardElement.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveCardNetUIRenderer
{
public:
	static void RegisterAdaptiveElements();

	static HRESULT HrCreateAdaptiveElement(const std::shared_ptr<BaseCardElement>& spCardElement, Element ** ppElement);

	template<typename T>
	static HRESULT HrCreateAdaptiveElement(T** ppAdaptiveElement)
	{
		HRESULT hr = NOERROR;
		Element* pElement;
		hr = T::Create(&pElement);

		if (FAILED(hr))
		{
			return hr;
		}

		*ppAdaptiveElement = (T*) pElement;

		return hr;
	};

	template<class T>
	static HRESULT HrCreateAdaptiveElement(T** ppAdaptiveElement, const std::shared_ptr<BaseCardElement>& spObjectModel)
	{
		HRESULT hr = NOERROR;
		hr = HrCreateAdaptiveElement(ppAdaptiveElement);

		if (*ppAdaptiveElement == nullptr || FAILED(hr))
		{
			return E_FAIL;
		}

		(*ppAdaptiveElement)->Load(spObjectModel);

		return hr;
	};
};


