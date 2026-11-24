--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.transform.template.util

local TransformTemplateCustomizerUtil = {}
package.loaded["org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil"] = TransformTemplateCustomizerUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local CustomizerTransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData")
local BodyData = java_lazy("org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData")
local TitleData = java_lazy("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TransformTemplateCustomizerUtil is declared before the requires
TransformTemplateCustomizerUtil.__index = TransformTemplateCustomizerUtil
TransformTemplateCustomizerUtil.className = "TransformTemplateCustomizerUtil"
TransformTemplateCustomizerUtil.javaClassName = "org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil"

function TransformTemplateCustomizerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.CUSTOMIZER_NAME == nil then self.CUSTOMIZER_NAME = nil end
    if self.BODY_VIEWNAMEKEY == nil then self.BODY_VIEWNAMEKEY = nil end
    if self.TITLE_VIEWNAMEKEY == nil then self.TITLE_VIEWNAMEKEY = nil end
    if self.GLOBALS_NEW == nil then self.GLOBALS_NEW = nil end
    if self.GLOBALS_INSERT == nil then self.GLOBALS_INSERT = nil end
    if self.GLOBALS_DELETE == nil then self.GLOBALS_DELETE = nil end
    if self.GLOBALS_EDIT == nil then self.GLOBALS_EDIT = nil end
    if self.GLOBALS_UPDATE == nil then self.GLOBALS_UPDATE = nil end
end


function TransformTemplateCustomizerUtil.getInstance()
        return TransformTemplateCustomizerUtil.instance_f
end


function TransformTemplateCustomizerUtil._jinit(self)
    TransformTemplateCustomizerUtil._init_fields(self)
        local commonStrings = CommonStrings.getInstance()
        local SPACE = CommonSeps.getInstance().SPACE
        self.CUSTOMIZER_NAME = SPACE .. tostring(CustomizerTransformInfoData.NAME)
        self.BODY_VIEWNAMEKEY = SPACE .. tostring(BodyData.getInstance().VIEWNAMEKEY)
        self.TITLE_VIEWNAMEKEY = SPACE .. tostring(TitleData.getInstance().VIEWNAMEKEY)
        self.GLOBALS_NEW = tostring(GLOBALS2.NEW) .. SPACE
        self.GLOBALS_INSERT = tostring(commonStrings.INSERT) .. SPACE
        self.GLOBALS_DELETE = tostring(commonStrings.DELETE) .. SPACE
        self.GLOBALS_EDIT = tostring(GLOBALS2.EDIT) .. SPACE
        self.GLOBALS_UPDATE = tostring(commonStrings.UPDATE) .. SPACE
    return self
end

function TransformTemplateCustomizerUtil.new(...)
    local self = setmetatable({}, TransformTemplateCustomizerUtil)
    TransformTemplateCustomizerUtil._jinit(self, ...)
    return self
end


function TransformTemplateCustomizerUtil:getPageNameHack(viewName, storeName)
        local SPACE = CommonSeps.getInstance().SPACE
        local ONE_EMPTY_STRING_ARRAY = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put({viewName .. SPACE}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({storeName .. SPACE}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.CUSTOMIZER_NAME}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.BODY_VIEWNAMEKEY}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.TITLE_VIEWNAMEKEY}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.GLOBALS_NEW}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.GLOBALS_INSERT}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.GLOBALS_DELETE}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.GLOBALS_EDIT}, ONE_EMPTY_STRING_ARRAY)
        hashMap:put({self.GLOBALS_UPDATE}, ONE_EMPTY_STRING_ARRAY)
        local replace = nil
        local rootViewName = replace:all(viewName)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("RootViewName for ObjectConfig: " .. rootViewName, self, "getPageNameHack")
        end
        return rootViewName
end

TransformTemplateCustomizerUtil.instance_f = TransformTemplateCustomizerUtil.new()

return TransformTemplateCustomizerUtil

