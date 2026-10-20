-- Generated Code Do Not Modify
-- package org.allbinary.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local TsUtil = require("org.allbinary.TsUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SynchObject = require("org.allbinary.thread.SynchObject")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerManager = {}
LayerManager.__index = LayerManager
LayerManager.className = "LayerManager"

function LayerManager:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.systemWrapper = ABSystemWrapper.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.layerManagerLogging = nil
    self.list = BasicArrayListD.new()
    self.anyType = SynchObject.new()
end


function LayerManager.new(layerManagerLogging)
    local self = setmetatable({}, LayerManager)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.layerManagerLogging = layerManagerLogging
    return self
end


function LayerManager:contains(layerInterface)
        return self.list:contains(layerInterface)
end


-- throws Exception
function LayerManager:update(layerInterface)
        local had = self.list:remove(layerInterface)
        if had then
            local nextLayerInterface = nil
            local size = self.list:size()
            for index = 0, size - 1 do
                nextLayerInterface = self.list:get(index)
                if layerInterface:getZP() > nextLayerInterface:getZP() then
                    self.list:addAt(index, layerInterface)
                    return
                end
            end
            self.list:add(layerInterface)
        end
end


-- throws Exception
function LayerManager:insert(layerInterface)
        local nextLayerInterface = nil
        local size = self.list:size()
        for index = 0, size - 1 do
            nextLayerInterface = self.list:get(index)
            if layerInterface:getZP() > nextLayerInterface:getZP() then
                self:appendAt(layerInterface, index)
                return
            end
        end
        self:append(layerInterface)
end


-- throws Exception
function LayerManager:append(layerInterface)
        self.layerManagerLogging:append(layerInterface)
        self.list:add(layerInterface)
end


-- throws Exception
function LayerManager:appendAt(layerInterface, index)
        self.layerManagerLogging:appendAt(layerInterface, index)
        self.list:addAt(index, layerInterface)
end


-- throws Exception
function LayerManager:remove(layerInterface)
        do -- synchronized (self.anyType)
            self.layerManagerLogging:remove(layerInterface)
            local result = self.list:remove(layerInterface)
            self.layerManagerLogging:removeResult(self, layerInterface, result)
        end
end


function LayerManager:getLayerAt(index)
        return self.list.objectArray[index + 1]
end


function LayerManager:getSize()
        return self.list:size()
end


-- throws Exception
function LayerManager:cleanup()
        do -- synchronized (self.anyType)
            self.list:clear()
            self.layerManagerLogging:clear()
            self.tsUtil:gc()
            self.tsUtil:gc()
        end
end


function LayerManager:paint(g, x, y)
        do -- synchronized (self.anyType)
            local comp = nil
            do
                local index = self.list:size()
                while (function() index = index - 1 return index end)() >= 0 do
                comp = self.list.objectArray[index + 1]
                if comp ~= nil and comp:isVisible() then
                    comp:paint(g)
                end
                end
            end
        end
end

return LayerManager

