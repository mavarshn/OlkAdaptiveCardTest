#pragma once

#include <nuielement.h>
#include <nuivalue.h>

using namespace NetUI;
class AdaptiveColumnSet : public Element
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// Properties
	QUICKBOOL(StartLayout);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;
};

