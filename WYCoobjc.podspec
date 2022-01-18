Pod::Spec.new do |s|
  s.name         = "WYCoobjc"
  s.version      = "0.1.0"
  s.summary      = "A coroutine framework for Objective-C"

  s.description  = <<-DESC
                    This library provides coroutine support for Objective-C and Swift. We added await method、generator and actor model like C#、Javascript and Kotlin. For convenience, we added coroutine categories for some Foundation and UIKit API in cokit framework like NSFileManager, JSON, NSData, UIImage etc. We also add tuple support in coobjc
                   DESC

  s.homepage     = "https://github.com/alibaba/coobjc"
  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
           Alibaba-INC copyright
    LICENSE
  }

  s.author       = { "pengyutang125" => "pengyutang125@sina.com" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  # s.source =  { :git => "git@github.com:Wavely-California/wavely_coobjc.git", :tag => s.version }
  s.source =  { :git => "../", :tag => s.version }

  s.subspec 'cocore' do |ss|
    ss.source_files = 'cocore/*.{h,m,s,c,mm}'
    ss.requires_arc = 'WYCoobjc/cocore/*.m'
    ss.library = 'c++'
  end

  s.subspec 'coobjc' do |ss|
    ss.source_files = 'coobjc/**/*.{h,m}'
    ss.requires_arc = ['coobjc/co/*.m', 'coobjc/generator/*.m', 'coobjc/actor/*.m', 'coobjc/promise/*.m']
    ss.dependency 'WYCoobjc/cocore'
  end

  s.subspec 'cokit' do |ss|
    ss.source_files = 'cokit/cokit/**/*.{h,m}'
    ss.dependency 'WYCoobjc/coobjc'
  end



  # s.subspec 'coswift' do |ss|
  #   ss.requires_arc = true
  #   ss.source_files = 'coswift/*.{h,swift}'
  #   ss.swift_versions = ['4.2', '5.0', '5.1']
  #   ss.dependency 'WYCoobjc/cocore'
  # end

end
