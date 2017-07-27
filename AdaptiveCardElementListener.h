#pragma once
#include <functional>
#include <iostream>
#include "NUIUtil.h"

using namespace NetUI;
typedef std::function<void()> ExtentChangedCallback;

class AdaptiveCardElementListener : public BaseElementListener
{
public:
	AdaptiveCardElementListener(const ExtentChangedCallback& extentChangedCallback);

	/* BaseElementListener interface implementation methods */
	DWORD GetEventFilter() throw() override;
	void OnListenedPropertyChanged(NetUI::Node* peFrom, NetUI::PropertyInfo* ppi, int iIndex, NetUI::Value* pvOld, NetUI::Value* pvNew) throw() override;
	virtual void FinalRelease() override;

private: 
	ExtentChangedCallback m_ExtentChangedCallback = {};
};

