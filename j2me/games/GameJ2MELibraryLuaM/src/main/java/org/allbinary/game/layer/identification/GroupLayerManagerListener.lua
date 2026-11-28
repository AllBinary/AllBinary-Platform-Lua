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

local GroupLayerManagerListener = {}
package.loaded["org.allbinary.game.layer.identification.GroupLayerManagerListener"] = GroupLayerManagerListener

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

local Group = java_lazy("org.allbinary.game.identification.Group")
local GroupInterfaceCompositeInterface = java_lazy("org.allbinary.game.identification.GroupInterfaceCompositeInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LayerManagerEvent = java_lazy("org.allbinary.layer.event.LayerManagerEvent")
local LayerManagerEventHandler = java_lazy("org.allbinary.layer.event.LayerManagerEventHandler")
local LayerManagerEventListener = require("org.allbinary.layer.event.LayerManagerEventListener")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table GroupLayerManagerListener is declared before the requires
GroupLayerManagerListener.__index = GroupLayerManagerListener
GroupLayerManagerListener.className = "GroupLayerManagerListener"
GroupLayerManagerListener.javaClassName = "org.allbinary.game.layer.identification.GroupLayerManagerListener"
setmetatable(GroupLayerManagerListener, {__index = LayerManagerEventListener})

function GroupLayerManagerListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListD.new()
end


function GroupLayerManagerListener.getInstance()
        return GroupLayerManagerListener.SINGLETON
end


function GroupLayerManagerListener._jinit(self)
    java_super_init(LayerManagerEventListener, self)
    GroupLayerManagerListener._init_fields(self)
        LayerManagerEventHandler.getInstance():addListener(self)
    return self
end

function GroupLayerManagerListener.new(...)
    local self = setmetatable({}, GroupLayerManagerListener)
    GroupLayerManagerListener._jinit(self, ...)
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
java_overload(GroupLayerManagerListener, "clear", 0)


function GroupLayerManagerListener:getGroupSizeFromInterface(groupInterfaceCompositeInterface)
        local groupInterfaceArray = groupInterfaceCompositeInterface:getGroupInterface()
        return self:getGroupSize(groupInterfaceArray[1])
end
java_overload(GroupLayerManagerListener, "getGroupSizeFromInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GroupInterfaceCompositeInterface")) end)


function GroupLayerManagerListener:getGroupSize(groupInterface)
        local id = java_int(groupInterface:getGroupId())
        return self:getGroupSizeById(id)
end
java_overload(GroupLayerManagerListener, "getGroupSize", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Group")) end)


function GroupLayerManagerListener:getList(groupInterface)
        local id = java_int(groupInterface:getGroupId())
        return self:getListById(id)
end
java_overload(GroupLayerManagerListener, "getList", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Group")) end)


function GroupLayerManagerListener:getListById(groupId)
        local groupList = self.list.objectArray[groupId + 1]
        return groupList
end
java_overload(GroupLayerManagerListener, "getListById", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GroupLayerManagerListener:getGroupSizeById(groupId)
        local groupList = self.list.objectArray[groupId + 1]
        local size = groupList:size()
        return size
end
java_overload(GroupLayerManagerListener, "getGroupSizeById", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GroupLayerManagerListener:areAllOtherGroupsEmpty(groupInterface)
        local id = java_int(groupInterface:getGroupId())
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            if not rawequal(id, index) then
                local groupSize = self:getGroupSizeById(index)
                if not rawequal(groupSize, 0) then
                    self.logUtil:putF(tostring(StringMaker.new():append("Group Size: "):appendint(groupSize)), self, "areAllOtherGroupsEmpty")
                    return false
                end
            end
        end
        return true
end
java_overload(GroupLayerManagerListener, "areAllOtherGroupsEmpty", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Group")) end)


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
                if rawequal(groupId, id) then
                    return true
                end
            end
        end
        return false
end
java_overload(GroupLayerManagerListener, "isIdInList", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


function GroupLayerManagerListener:areAllOtherGroupsLessThan(excludeGroupList, maxSize)
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            if not (self:isIdInList(index, excludeGroupList)) then
                local groupSize = self:getGroupSizeById(index)
                if groupSize >= maxSize then
                    return false
                end
            end
        end
        return true
end
java_overload(GroupLayerManagerListener, "areAllOtherGroupsLessThan", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) and type(java_a2) == "number" end)


function GroupLayerManagerListener:init(total)
        while self.list:size() <= total + 1 do
            self.list:add(BasicArrayListD.new())
        end
end
java_overload(GroupLayerManagerListener, "init", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GroupLayerManagerListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(GroupLayerManagerListener, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


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
            if rawequal(groupList, nil) then
                self.logUtil:putF(tostring(StringMaker.new():append("id: "):appendint(id)), self, "onCreateLayerManagerEvent")
            end
            if not (groupList:contains(layerInterface)) then
                groupList:add(layerInterface)
            else
            end
        end
end
java_overload(GroupLayerManagerListener, "onCreateLayerManagerEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LayerManagerEvent")) end)


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
java_overload(GroupLayerManagerListener, "onDeleteLayerManagerEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LayerManagerEvent")) end)


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
java_overload(GroupLayerManagerListener, "log", 0)

GroupLayerManagerListener.SINGLETON = GroupLayerManagerListener.new()

return GroupLayerManagerListener

