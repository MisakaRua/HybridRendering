#pragma once

//#include <dxgi1_2.h>
//#include <dxgi1_4.h>
#include <dxgi1_6.h>

#ifndef NO_MAP
#define NO_MAP
#endif

#include "d3d10_1_base.h"

namespace dxup
{
	class DXGIFactory : public D3D10Base<IDXGIFactory1, IDXGIFactory5>
	{
	public:
		DXGIFactory(IDXGIFactory5* base);

		HRESULT STDMETHODCALLTYPE QueryInterface(
			REFIID                riid,
			void**                ppvObject) final;

		HRESULT STDMETHODCALLTYPE GetParent(
			REFIID                riid,
			void**                ppParent) final;

		HRESULT STDMETHODCALLTYPE CreateSoftwareAdapter(
			HMODULE               Module,
			IDXGIAdapter**        ppAdapter) final;

		HRESULT STDMETHODCALLTYPE CreateSwapChain(
			IUnknown*             pDevice,
			DXGI_SWAP_CHAIN_DESC* pDesc,
			IDXGISwapChain**      ppSwapChain) final;

		HRESULT STDMETHODCALLTYPE EnumAdapters(
			UINT                  Adapter,
			IDXGIAdapter**        ppAdapter) final;

		HRESULT STDMETHODCALLTYPE EnumAdapters1(
			UINT                  Adapter,
			IDXGIAdapter1**       ppAdapter) final;

		HRESULT STDMETHODCALLTYPE GetWindowAssociation(
			HWND*                 pWindowHandle) final;

		HRESULT STDMETHODCALLTYPE MakeWindowAssociation(
			HWND                  WindowHandle,
			UINT                  Flags) final;

		BOOL STDMETHODCALLTYPE IsCurrent();
	};

}
