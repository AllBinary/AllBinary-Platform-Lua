-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.input.form

local CompositeRTSFormInput = {}
package.loaded["org.allbinary.game.input.form.CompositeRTSFormInput"] = CompositeRTSFormInput

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

local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Group = java_lazy("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local UnitRTSFormInput = java_lazy("org.allbinary.game.input.form.UnitRTSFormInput")
local WaypointRTSFormInput = java_lazy("org.allbinary.game.input.form.WaypointRTSFormInput")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table CompositeRTSFormInput is declared before the requires
CompositeRTSFormInput.__index = CompositeRTSFormInput
CompositeRTSFormInput.className = "CompositeRTSFormInput"
CompositeRTSFormInput.javaClassName = "org.allbinary.game.input.form.CompositeRTSFormInput"
setmetatable(CompositeRTSFormInput, {__index = RTSFormInput})

function CompositeRTSFormInput:_init_fields()
    if self.rtsFormInputArray == nil then self.rtsFormInputArray = nil end
    if self.itemIndex == nil then self.itemIndex = nil end
    if self.isPrimaryWaypointCreator == nil then self.isPrimaryWaypointCreator = nil end
end


function CompositeRTSFormInput._jinit(self, groupInterface, isPrimaryWaypointCreator, itemIndex)
    java_super_init(RTSFormInput, self, groupInterface)
    CompositeRTSFormInput._init_fields(self)
        -- super(...) made self above
        self.itemIndex = itemIndex
        self.isPrimaryWaypointCreator = isPrimaryWaypointCreator
        self.rtsFormInputArray = java_new_array(nil, 2)
        self.rtsFormInputArray[1] = WaypointRTSFormInput.new(self.groupInterfaceArray, isPrimaryWaypointCreator)
        self.rtsFormInputArray[2] = UnitRTSFormInput.new(self.groupInterfaceArray)
    return self
end

function CompositeRTSFormInput.new(...)
    local self = setmetatable({}, CompositeRTSFormInput)
    CompositeRTSFormInput._jinit(self, ...)
    return self
end


-- throws Exception
function CompositeRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(RTSFormInput, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local size = (self.rtsFormInputArray.n or #self.rtsFormInputArray)
        for index = 0, size - 1 do
            self.rtsFormInputArray[index + 1]:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        end
end
java_overload(CompositeRTSFormInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function CompositeRTSFormInput:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        local scrollSelectionForm = rtsPlayerLayerInterface:getCurrentScrollSelectionForm()
        local index = scrollSelectionForm:getSelectedIndexForPoint(point)
        if self:isStickyItemSelected() and associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
            if self:getSelectedStickyItemIndex() <= self.itemIndex[1] then
                self.rtsFormInputArray[1]:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
            end
        elseif index > self.itemIndex[1] then
            self.rtsFormInputArray[2]:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        end
end
java_overload(CompositeRTSFormInput, "processAtPoint", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "GPoint")) end)


-- throws Exception
function CompositeRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(CommonLabels.getInstance().INDEX_LABEL + index) .. " > " .. tostring(self.itemIndex[1]), self, commonStrings.PROCESS)
        if self:isStickyItemSelected() and associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
            if self:getSelectedStickyItemIndex() <= self.itemIndex[1] then
                self.rtsFormInputArray[1]:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
            end
        elseif index > self.itemIndex[1] then
            self.rtsFormInputArray[2]:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        end
end
java_overload(CompositeRTSFormInput, "processGameSpecific", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "ABCustomItem")) and type(java_a5) == "number" end)


-- throws Exception
function CompositeRTSFormInput:processSticky(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        return self.rtsFormInputArray[1]:processSticky(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
end
java_overload(CompositeRTSFormInput, "processSticky", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "GPoint")) end)


-- throws Exception
function CompositeRTSFormInput:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        self.rtsFormInputArray[1]:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
end
java_overload(CompositeRTSFormInput, "processStickyGameSpecific", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "ABCustomItem")) and type(java_a5) == "number" end)


function CompositeRTSFormInput:getSelectedStickyItemIndex()
        return self.rtsFormInputArray[1]:getSelectedStickyItemIndex()
end
java_overload(CompositeRTSFormInput, "getSelectedStickyItemIndex", 0)


function CompositeRTSFormInput:isStickyItemSelected()
        return self.rtsFormInputArray[1]:isStickyItemSelected()
end
java_overload(CompositeRTSFormInput, "isStickyItemSelected", 0)


function CompositeRTSFormInput:setStickyItemSelected(stickyItemSelected)
        self.rtsFormInputArray[1]:setStickyItemSelected(stickyItemSelected)
end
java_overload(CompositeRTSFormInput, "setStickyItemSelected", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function CompositeRTSFormInput:getSelectedStickyItem()
        return self.rtsFormInputArray[1]:getSelectedStickyItem()
end
java_overload(CompositeRTSFormInput, "getSelectedStickyItem", 0)


function CompositeRTSFormInput:setSelectedStickyItem(selectedStickyItem)
        self.rtsFormInputArray[1]:setSelectedStickyItem(selectedStickyItem)
end
java_overload(CompositeRTSFormInput, "setSelectedStickyItem", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)

return CompositeRTSFormInput

