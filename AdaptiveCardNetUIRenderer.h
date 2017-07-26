#pragma once

#include <nuielement.h>
#include "TextBlock.h"

class AdaptiveCardNetUIRenderer
{
public:
	AdaptiveCardNetUIRenderer();
	~AdaptiveCardNetUIRenderer();

	HRESULT BuildTextBlock(const AdaptiveCards::TextBlock textBlock, NetUI::Element ** label);
};

