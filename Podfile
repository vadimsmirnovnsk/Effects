platform :ios, '10.0'
ENV["COCOAPODS_DISABLE_STATS"] = "1"
use_modular_headers!
inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

def base;          pod 'VNBase'						end

target 'Effects' do
  base
end

# Change default pods builds folder to avoid conflict with v4ios builds folder
post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|

			config.build_settings['SWIFT_VERSION'] = '5.0'
			if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
				config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
			end
			if config.name == 'Release'
				# Для релизной конфигурации включаем максимальный уровень оптимизации
				config.build_settings['GCC_OPTIMIZATION_LEVEL'] = 'fast'
				config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
				config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
				config.build_settings['BITCODE_GENERATION_MODE'] = 'marker'
				config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
			end

			if target.name.start_with?('VN', 'Pods')
				config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'NO'
			else
				config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
			end

		end
	end

end
