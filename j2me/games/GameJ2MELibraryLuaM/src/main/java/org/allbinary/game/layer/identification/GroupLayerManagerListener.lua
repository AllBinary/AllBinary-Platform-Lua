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
-- package org.allbinary.game.layer.identification

local Group = require("org.allbinary.game.identification.Group")
local GroupInterfaceCompositeInterface = require("org.allbinary.game.identification.GroupInterfaceCompositeInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LayerManagerEvent = require("org.allbinary.layer.event.LayerManagerEvent")
local LayerManagerEventHandler = require("org.allbinary.layer.event.LayerManagerEventHandler")
local LayerManagerEventListener = require("org.allbinary.layer.event.LayerManagerEventListener")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GroupLayerManagerListener = {}
GroupLayerManagerListener.__index = GroupLayerManagerListener
GroupLayerManagerListener.className = "GroupLayerManagerListener"
setmetatable(GroupLayerManagerListener, {__index = LayerManagerEventListener})

function GroupLayerManagerListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListD.new()
end


function GroupLayerManagerListener.getInstance()
        return GroupLayerManagerListener.SINGLETON
end


function GroupLayerManagerListener.new()
    local self = setmetatable(LayerManagerEventListener.new(), GroupLayerManagerListener)
    self:_init_fields()
        LayerManagerEventHandler.getInstance():addListener(self)
    return self
end


function GroupLayerManagerListener:clear()
        local groupList = nil
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            groupList = self.list.objectArray[index + 1]
            groupList:clear()
        end
end


function GroupLayerManagerListener:getGroupSizeFromInterface(groupInterfaceCompositeInterface)
        local groupInterfaceArray = groupInterfaceCompositeInterface:getGroupInterface()
        return self:getGroupSize(groupInterfaceArray[1])
end


function GroupLayerManagerListener:getGroupSize(groupInterface)
        local id = java_int(groupInterface:getGroupId())
        return self:getGroupSizeById(id)
end


function GroupLayerManagerListener:getList(groupInterface)
        local id = java_int(groupInterface:getGroupId())
        return self:getListById(id)
end


function GroupLayerManagerListener:getListById(groupId)
        local groupList = self.list.objectArray[groupId + 1]
        return groupList
end


function GroupLayerManagerListener:getGroupSizeById(groupId)
        local groupList = self.list.objectArray[groupId + 1]
        local size = groupList:size()
        return size
end


function GroupLayerManagerListener:areAllOtherGroupsEmpty(groupInterface)
        local id = java_int(groupInterface:getGroupId())
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            if id ~= index then
                local groupSize = self:getGroupSizeById(index)
                if groupSize ~= 0 then
                    self.logUtil:putF(tostring(StringMaker.new():append("Group Size: "):appendint(groupSize)), self, "areAllOtherGroupsEmpty")
                    return false
                end
            end
        end
        return true
end


function GroupLayerManagerListener:isIdInList(id, excludeGroupList)
        local size = excludeGroupList:size()
        local groupInterfaceArray = nil
        local groupInterface = nil
        local groupId = 0
        for index = size - 1, 0, -1 do
            groupInterfaceArray = excludeGroupList.objectArray[index + 1]
            local size2 = (groupInterfaceArray.n or #groupInterfaceArray)
            for index2 = 0, size2 - 1 do
                groupInterface = groupInterfaceArray[index2 + 1]
                groupId = java_int(groupInterface:getGroupId())
                if groupId == id then
                    return true
                end
            end
        end
        return false
end


function GroupLayerManagerListener:areAllOtherGroupsLessThan(excludeGroupList, maxSize)
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            if not self:isIdInList(index, excludeGroupList) then
                local groupSize = self:getGroupSizeById(index)
                if groupSize >= maxSize then
                    return false
                end
            end
        end
        return true
end


function GroupLayerManagerListener:init(total)
        while self.list:size() <= total + 1 do
            self.list:add(BasicArrayListD.new())
        end
end


function GroupLayerManagerListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function GroupLayerManagerListener:onCreateLayerManagerEvent(layerManagerEvent)
        local layerInterface = layerManagerEvent:getLayerInterface()
        local groupInterfaceArray = layerInterface:getGroupInterface()
        local size = (groupInterfaceArray.n or #groupInterfaceArray)
        local id = 0
        local groupList = nil
        for index = 0, size - 1 do
            id = java_int(groupInterfaceArray[index + 1]:getGroupId())
            groupList = self.list.objectArray[id + 1]
            if groupList == nil then
                self.logUtil:putF(tostring(StringMaker.new():append("id: "):appendint(id)), self, "onCreateLayerManagerEvent")
            end
            if not groupList:contains(layerInterface) then
                groupList:add(layerInterface)
            else
            end
        end
end


-- throws Exception
function GroupLayerManagerListener:onDeleteLayerManagerEvent(layerManagerEvent)
        local layerInterface = layerManagerEvent:getLayerInterface()
        local groupInterfaceArray = layerInterface:getGroupInterface()
        local size = (groupInterfaceArray.n or #groupInterfaceArray)
        local id = 0
        local groupList = nil
        for index = 0, size - 1 do
            id = java_int(groupInterfaceArray[index + 1]:getGroupId())
            groupList = self.list.objectArray[id + 1]
            groupList:remove(layerInterface)
        end
end


function GroupLayerManagerListener:log()
        local stringBuffer = StringMaker.new()
        local GROUP = "Group: "
        local SPACE = CommonSeps.getInstance().SPACE
        local TOTAL_LABEL = CommonLabels.getInstance().TOTAL_LABEL
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            local groupList = self.list.objectArray[index + 1]
            stringBuffer:append(GROUP)
            stringBuffer:appendint(index)
            stringBuffer:append(SPACE)
            stringBuffer:append(TOTAL_LABEL)
            stringBuffer:appendint(groupList:size())
            stringBuffer:append(SPACE)
        end
        self.logUtil:putF(tostring(stringBuffer), self, "log")
end

GroupLayerManagerListener.SINGLETON = GroupLayerManagerListener.new()

return GroupLayerManagerListener

