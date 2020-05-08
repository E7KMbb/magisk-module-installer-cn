##########################################################################################
# SKIPUNZIP
##########################################################################################

# 如果您需要更多的自定义，并且希望自己做所有事情
# 请在custom.sh中标注SKIPUNZIP=1
# 以跳过提取操作并应用默认权限/上下文上下文步骤。
# 请注意，这样做后，您的custom.sh将负责自行安装所有内容。
SKIPUNZIP=0

##########################################################################################
# 替换列表
##########################################################################################

# 列出你想在系统中直接替换的所有目录
# 查看文档，了解更多关于Magic Mount如何工作的信息，以及你为什么需要它


# 按照以下格式构建列表
# 这是一个示例
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# 在这里建立您自己的清单
REPLACE="
"
##########################################################################################
# 安装设置
##########################################################################################

# 如果SKIPUNZIP=1您将会需要使用以下代码
# 当然，你也可以自定义安装脚本
# 需要时请删除#
#  # 将 $ZIPFILE/system 提取到 $MODPATH
#  ui_print "- 解压模块文件"
#  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'module.prop' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'system.prop' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'sepolicy.rule' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'service.sh' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'post-fs-data.sh' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'uninstall.sh' -d $MODPATH >&2

##########################################################################################
# 权限设置
##########################################################################################

set_permissions() {
  : #如果添加到此功能，请将其删除

  # 请注意，magisk模块目录中的所有文件/文件夹都有$MODPATH前缀-在所有文件/文件夹中保留此前缀
  # 一些例子:
  
  # 对于目录(包括文件):
  # set_perm_recursive  <目录>                <所有者> <用户组> <目录权限> <文件权限> <上下文> (默认值是: u:object_r:system_file:s0)
  
  # set_perm_recursive $MODPATH/system/lib 0 0 0755 0644
  # set_perm_recursive $MODPATH/system/vendor/lib/soundfx 0 0 0755 0644

  # 对于文件(不包括文件所在目录)
  # set_perm  <文件名>                         <所有者> <用户组> <文件权限> <上下文> (默认值是: u:object_r:system_file:s0)
  
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644

  # 默认权限请勿删除
  set_perm_recursive $MODPATH 0 0 0755 0644
}

