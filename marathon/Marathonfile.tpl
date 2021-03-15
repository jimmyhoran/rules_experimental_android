name: "{name}"
outputDir: "{outputDir}"
isCodeCoverageEnabled: true
retryStrategy:
  type: "fixed-quota"
  totalAllowedRetryQuota: 100
  retryPerTestQuota: 2
vendorConfiguration:
  type: "Android"
  androidSdk: "{androidSdk}"
  applicationApk: "{applicationApk}"
  testApplicationApk: "{testApplicationApk}"
  autoGrantPermission: true
  instrumentationArgs:
    debug: "false"
  applicationPmClear: true
  testApplicationPmClear: true
  vendor: ADAM
  waitForDevicesTimeoutMillis: 60000
  allureConfiguration:
    enabled: true
deviceInitializationTimeoutMillis: 180000
