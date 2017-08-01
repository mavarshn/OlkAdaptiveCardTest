#pragma once

#include <nuielement.h>
#include <nuivalue.h>
#include "ColumnSet.h"

using namespace NetUI;
using namespace AdaptiveCards;

class AdaptiveColumnSet : public Element
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;

	void Populate(const std::shared_ptr<ColumnSet>& spColumnSet);
	void Layout(ULONG ulWidth);

private:
	std::shared_ptr<ColumnSet> m_spColumnSet;
};