#pragma once
using namespace NetUI;

_Callback_ HRESULT NETUI_API FindTotalWidth(Element *pe, void *pv);

_Callback_ HRESULT NETUI_API UpdateWrap(Element *pe, void*);

_Callback_ HRESULT NETUI_API AdjustWidth(Element *pe, void *pv);

HRESULT ForAllDescendentsWithAtomId(Element* pRoot, ATOM atomID, ElementIterator pfnElement, void *pv);

HRESULT ForAllDescendentsWithId(Element* pRoot, LPCWSTR wzClassName, ElementIterator pfnElement, void *pv);

_Callback_ HRESULT NETUI_API UpdateColumnLayout(Element *pe, void *pv);

