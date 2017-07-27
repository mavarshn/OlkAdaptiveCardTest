#include "stdafx.h"
#include "AdaptiveCardElementListener.h"

#define IsPropChanged(p) IsProp(p) && pvOld != pvNew && pvNew

AdaptiveCardElementListener::AdaptiveCardElementListener(const ExtentChangedCallback& extentChangedCallback) : m_ExtentChangedCallback(extentChangedCallback)
{
}

// method to provide list of events this class is listening to
DWORD AdaptiveCardElementListener::GetEventFilter() throw()
{
	return NetUI::ELF_PropertyChanged;
}

void AdaptiveCardElementListener::FinalRelease()
{
	HDelete(AdaptiveCardElementListener, this);
}

void AdaptiveCardElementListener::OnListenedPropertyChanged(NetUI::Node* /* peFrom */, NetUI::PropertyInfo* ppi, int iIndex, NetUI::Value* pvOld, NetUI::Value* pvNew) throw()
{
	if (IsPropChanged(NetUI::Element::Extent) &&
		m_ExtentChangedCallback)
	{
		m_ExtentChangedCallback();
	}
}