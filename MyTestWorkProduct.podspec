Pod::Spec.new do |spec|
  #名称
  spec.name         = "MyTestWorkProduct"
  #版本号
  spec.version      = "1.0.0"
  #描述
  spec.summary      = "本地demo工程"
  #描述页面
  spec.homepage     = "http://www.xkeshi.com"
  #版权声明
  spec.license      = 'MIT'
  #作者
  spec.author       = { "zf" => "zf@xkeshi.com" }
  #支持的系统
  spec.platform     = :ios, '8.0'
  spec.source       = { :path => "MyTestWorkProduct", }


  #如果是开发版本,没有发布release版本,可以这样写 :commit => "e677206ce4f0dc5f96639621d920f71c53704246"
  #spec.source       = { :git => "git@gitlab.ops.xkeshi.so:iOSSynergism/LanSynergismAdapter.git", :commit => "3c09d8e5"}

  #是否需要arc
  spec.requires_arc = true
  #源码 (swift写法: 路径/*.swift)
  #路径必须写对: 相对路径/**/*, **/*表示匹配子目录下的所有文件
  spec.source_files  = "MyTestWorkProduct/Category/**/*.{h,m}"
  #源码 bundle文件
  spec.resource_bundles = {
    'MyTestWorkProduct' => [
        'MyTestWorkProduct/Category/**/*.{storyboard,xcassets,xib,png}'
    ]
  }
end
