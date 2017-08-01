#pragma once
using namespace NetUI;

_Callback_ HRESULT NETUI_API FindTotalWidth(Element *pe, void *pv);

HRESULT ForAllChildrenOfType(Element* pRoot, LPCWSTR wzClassName, ElementIterator pfnElement, void *pv);

HRESULT LayoutAdaptiveColumnSets(Element* pRoot, ULONG ulWidth);
