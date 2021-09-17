Pod::Spec.new do |s|
    
  s.name                    = 'LightweightCharts'
  s.version                 = '3.6.1'
  s.summary                 = 'LightweightCharts for iOS.'
  s.description             = 'LightweightCharts pod. Swift wrapper above JavaScript library.'
  s.homepage                = 'https://tradingview.com'
  s.license                 = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author                  = { 'TradingView, Inc.' => 'noreply@tradingview.com' }
  s.source                  = { :git => 'https://github.com/tradingview/LightweightChartsIOS.git', :tag => s.version }
  s.ios.deployment_target   = '10.0'
  s.source_files            = 'LightweightCharts/**/*.swift'
  s.resources               = 'LightweightCharts/Assets/*'
  s.swift_version           = '5.0'

  s.script_phase = {
      :name => 'LightweightCharts',
      
      :script => 'LIBRARY=${TEMP_DIR}/lightweight-charts.js
      
if [ "${CONFIGURATION}" = "Release" ]; then
    curl -o $LIBRARY https://unpkg.com/lightweight-charts@3.6.1/dist/lightweight-charts.standalone.production.js
else
    curl -o $LIBRARY https://unpkg.com/lightweight-charts@3.6.1/dist/lightweight-charts.standalone.development.js
fi

cp -f $LIBRARY ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/lightweight-charts.js'
  }
  
end
