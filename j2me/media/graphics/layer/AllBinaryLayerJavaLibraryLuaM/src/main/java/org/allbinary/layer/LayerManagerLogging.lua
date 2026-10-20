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
-- package org.allbinary.layer

local TsUtil = require("org.allbinary.TsUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local LayerManagerLoggingBase = require("org.allbinary.layer.LayerManagerLoggingBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerManagerLogging = {}
LayerManagerLogging.__index = LayerManagerLogging
LayerManagerLogging.className = "LayerManagerLogging"
setmetatable(LayerManagerLogging, {__index = LayerManagerLoggingBase})

function LayerManagerLogging:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringBuilder = StringMaker.new()
    self.APPEND = "append"
    self.APPEND_ = " append: "
    self._AT_ = " at: "
    self.ATTEMPT_REMOVE_ = " Remove Attempt: "
    self.REMOVE_ = " Remove: "
    self.REMOVE = "remove"
    self.DID_NOT_REMOVE = " Did not remove: "
    self.CLEAR = " Clear List"
end

function LayerManagerLogging.new()
    local self = setmetatable(LayerManagerLoggingBase.new(), LayerManagerLogging)
    self:_init_fields()
    return self
end


function LayerManagerLogging.getInstance()
        return LayerManagerLogging.instance
end


-- throws Exception
function LayerManagerLogging:append(layerInterface)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.APPEND_):append(layerInterface:getName())), self, self.APPEND)
end


function LayerManagerLogging:appendAt(layerInterface, index)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.APPEND_):append(layerInterface:getName()):append(self._AT_):appendint(index)), self, self.APPEND)
end


function LayerManagerLogging:remove(layerInterface)
        if layerInterface == nil then
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.ATTEMPT_REMOVE_):append(StringUtil.getInstance():toString(layerInterface))), self, self.REMOVE)
        else
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.ATTEMPT_REMOVE_):append(layerInterface:getName())), self, self.REMOVE)
        end
end


function LayerManagerLogging:removeResult(layerManager, layerInterface, result)
        if layerInterface == nil then
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.REMOVE_):append(StringUtil.getInstance():toString(layerInterface))), self, self.REMOVE)
        elseif result then
            if LayerManagerLogging.removeFailed then
                self.stringBuilder:delete(0, self.stringBuilder:length())
                self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.REMOVE_):append(layerInterface:getName())), self, self.REMOVE)
            end
        else
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.DID_NOT_REMOVE):append(layerInterface:getName())), self, self.REMOVE)
            LayerManagerLogging.removeFailed = true
        end
end


function LayerManagerLogging:log(layerManager)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        local size = layerManager:getSize()
        local commonSeps = CommonSeps.getInstance()
        self.stringBuilder:append(string.format("%x", TsUtil.getInstance():hashCode(layerManager))):append(commonSeps.COLON_SEP)
        self.stringBuilder:appendint(size):append(commonSeps.COLON_SEP)
        local allBinaryLayer = nil
        for index = 0, size - 1 do
            allBinaryLayer = (layerManager:getLayerAt(index))
            self.stringBuilder:append(allBinaryLayer:getName()):append(commonSeps.COMMA)
        end
        self.logUtil:putF(tostring(self.stringBuilder), self, self.REMOVE)
end


function LayerManagerLogging:clear()
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.CLEAR)), self, self.CLEAR)
end

LayerManagerLogging.instance = LayerManagerLogging.new()
LayerManagerLogging.removeFailed = false

return LayerManagerLogging

