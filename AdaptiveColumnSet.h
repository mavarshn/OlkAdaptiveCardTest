#pragma once
#include <iostream>
#include <nuielement.h>

class AdaptiveColumnSet
{
public:
	void AddColumnSet(NetUI::Element* pRootElement);
	void AddColumn(NetUI::Element* pColumnSet, const std::wstring &label, bool setWrap = false);
	void LayoutColumnSet(NetUI::Element* pRootElement);
	void AddLabels(NetUI::Element* pColumn, const std::wstring &label, bool setWrap = false);
};

