#pragma once

#include "SharedAdaptiveCard.h"
#include <fstream>
#include <string>

class AdaptiveNetUIViewer
{
public:
	AdaptiveNetUIViewer();
	~AdaptiveNetUIViewer();

	HRESULT BuildAdaptiveCardFromTextFile(NetUI::Element ** card);
};

