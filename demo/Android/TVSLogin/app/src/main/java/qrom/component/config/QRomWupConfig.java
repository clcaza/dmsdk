package qrom.component.config;

import qrom.component.wup.QRomWupBaseConfig;

public class QRomWupConfig extends QRomWupBaseConfig {

	private static final boolean FORCE_WUP_FOR_TEST = false;

	@Override
	public String getAppPackageName() {
		return "com.tencent.ai.dobbydemo";
	}

	@Override
	public boolean isRunTestForced() {
		return FORCE_WUP_FOR_TEST;
	}

	@Override
	public String getTestWupProxyAddr() {
		return super.getTestWupProxyAddr();
	}

	@Override
	public String getTestWupSocketProxyAddr() {
		return super.getTestWupSocketProxyAddr();
	}

}
