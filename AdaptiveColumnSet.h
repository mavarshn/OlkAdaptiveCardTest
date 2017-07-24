#pragma once

#include <nuielement.h>

class AdaptiveColumnSet
{
public:
	AdaptiveColumnSet();
	~AdaptiveColumnSet();

	void AddColumnSet(NetUI::Element* pRootElement);
	void AddColumn(NetUI::Element* pColumnSet);
	void LayoutColumnSet(NetUI::Element* pRootElement);
	void AddLabels(NetUI::Element* pColumn);
};

