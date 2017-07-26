#pragma once

#include <nuielement.h>
#include <nuivalue.h>

using namespace NetUI;
class AdaptiveLabel: public Label
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// Properties
	QUICKBOOL(WrapText);

	// ClassInfo accessors
	DEFINE_NETUI_CLASS_INFO;
};

