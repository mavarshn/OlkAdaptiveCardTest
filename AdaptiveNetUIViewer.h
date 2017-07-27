#pragma once

#include "..\OlkAdaptiveCardObjectModel\SharedAdaptiveCard.h"
#include <fstream>
#include <string>

class AdaptiveNetUIViewer
{
public:
	AdaptiveNetUIViewer();
	~AdaptiveNetUIViewer();

	HRESULT BuildAdaptiveCardFromTextFile(NetUI::Element ** card);
};

