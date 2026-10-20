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

-- local HashMap = require("java.util.HashMap")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local CustomizerTransformInfoData = require("org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData")
local BodyData = require("org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData")
local TitleData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformTemplateCustomizerUtil = {}
TransformTemplateCustomizerUtil.__index = TransformTemplateCustomizerUtil
TransformTemplateCustomizerUtil.className = "TransformTemplateCustomizerUtil"

function TransformTemplateCustomizerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.CUSTOMIZER_NAME = nil
    self.BODY_VIEWNAMEKEY = nil
    self.TITLE_VIEWNAMEKEY = nil
    self.GLOBALS_NEW = nil
    self.GLOBALS_INSERT = nil
    self.GLOBALS_DELETE = nil
    self.GLOBALS_EDIT = nil
    self.GLOBALS_UPDATE = nil
end


function TransformTemplateCustomizerUtil.getInstance()
        return TransformTemplateCustomizerUtil.instance
end


function TransformTemplateCustomizerUtil.new()
    local self = setmetatable({}, TransformTemplateCustomizerUtil)
    self:_init_fields()
        local commonStrings = CommonStrings.getInstance()
        local SPACE = CommonSeps.getInstance().SPACE
        self.CUSTOMIZER_NAME = SPACE .. tostring(CustomizerTransformInfoData.NAME)
        self.BODY_VIEWNAMEKEY = SPACE .. tostring(BodyData.getInstance().VIEWNAMEKEY)
        self.TITLE_VIEWNAMEKEY = SPACE .. tostring(TitleData.getInstance().VIEWNAMEKEY)
        self.GLOBALS_NEW = tostring(self.GLOBALS2.NEW) .. SPACE
        self.GLOBALS_INSERT = tostring(commonStrings.INSERT) .. SPACE
        self.GLOBALS_DELETE = tostring(commonStrings.DELETE) .. SPACE
        self.GLOBALS_EDIT = tostring(self.GLOBALS2.EDIT) .. SPACE
        self.GLOBALS_UPDATE = tostring(commonStrings.UPDATE) .. SPACE
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
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("RootViewName for ObjectConfig: " .. rootViewName, self, "getPageNameHack")
        end
        return rootViewName
end

TransformTemplateCustomizerUtil.instance = TransformTemplateCustomizerUtil.new()

return TransformTemplateCustomizerUtil

