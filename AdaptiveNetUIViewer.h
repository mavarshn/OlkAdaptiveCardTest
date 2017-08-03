#pragma once

#include "SharedAdaptiveCard.h"
#include "nuielement.h"
#include <fstream>
#include <string>

class AdaptiveNetUIViewer
{
public:
	HRESULT AdaptiveNetUIViewer::RenderAdaptiveCardFromTextFile(NetUI::NUIDocument * nuiDocument);
};

