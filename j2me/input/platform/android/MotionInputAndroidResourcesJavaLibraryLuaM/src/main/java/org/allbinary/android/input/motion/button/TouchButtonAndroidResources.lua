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
-- package org.allbinary.android.input.motion.button

local TouchButtonAndroidResources = {}
package.loaded["org.allbinary.android.input.motion.button.TouchButtonAndroidResources"] = TouchButtonAndroidResources

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

local AndroidResources = java_lazy("org.allbinary.AndroidResources")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local Init = require("org.allbinary.init.Init")
local CommonButtons = java_lazy("org.allbinary.input.motion.button.CommonButtons")
local TouchButtonBlankResource = java_lazy("org.allbinary.input.motion.button.TouchButtonBlankResource")
local TouchButtonDownResource = java_lazy("org.allbinary.input.motion.button.TouchButtonDownResource")
local TouchButtonGenericActionResource = java_lazy("org.allbinary.input.motion.button.TouchButtonGenericActionResource")
local TouchButtonResource = java_lazy("org.allbinary.input.motion.button.TouchButtonResource")
local TouchButtonStartResource = java_lazy("org.allbinary.input.motion.button.TouchButtonStartResource")
local TouchButtonStrafeLeftResource = java_lazy("org.allbinary.input.motion.button.TouchButtonStrafeLeftResource")
local TouchButtonStrafeRightResource = java_lazy("org.allbinary.input.motion.button.TouchButtonStrafeRightResource")
local TouchButtonTurnLeftResource = java_lazy("org.allbinary.input.motion.button.TouchButtonTurnLeftResource")
local TouchButtonTurnRightResource = java_lazy("org.allbinary.input.motion.button.TouchButtonTurnRightResource")
local TouchButtonUpResource = java_lazy("org.allbinary.input.motion.button.TouchButtonUpResource")
local OperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.OperatingSystemFactory")

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

-- class table TouchButtonAndroidResources is declared before the requires
TouchButtonAndroidResources.__index = TouchButtonAndroidResources
TouchButtonAndroidResources.className = "TouchButtonAndroidResources"
TouchButtonAndroidResources.javaClassName = "org.allbinary.android.input.motion.button.TouchButtonAndroidResources"
setmetatable(TouchButtonAndroidResources, {__index = Init})

function TouchButtonAndroidResources._jinit(self)
    java_super_init(Init, self)
    return self
end

function TouchButtonAndroidResources.new()
    return TouchButtonAndroidResources._jinit(setmetatable({}, TouchButtonAndroidResources))
end


function TouchButtonAndroidResources:init()
        local resourceUtil = ResourceUtil.getInstance()
        local androidResources = AndroidResources.getInstance()
        local RESOURCE_STRING_ARRAY = {TouchButtonBlankResource.getInstance(), TouchButtonGenericActionResource.getInstance(), TouchButtonStartResource.getInstance(), TouchButtonUpResource.getInstance(), TouchButtonDownResource.getInstance(), TouchButtonTurnLeftResource.getInstance(), TouchButtonTurnRightResource.getInstance(), TouchButtonStrafeLeftResource.getInstance(), TouchButtonStrafeRightResource.getInstance()}
        local RESOURCE_ARRAY = java_typed_array("I", java_new_array(0, (RESOURCE_STRING_ARRAY.n or #RESOURCE_STRING_ARRAY)))
        if CommonButtons.getInstance().STANDARD_BUTTON_SIZE == 128 then
            RESOURCE_ARRAY[1] = androidResources.raw.touch_button_128_by_128
            RESOURCE_ARRAY[2] = androidResources.raw.touch_button_generic_action_128_by_128
            RESOURCE_ARRAY[3] = androidResources.raw.touch_button_start_128_by_128
            RESOURCE_ARRAY[4] = androidResources.raw.touch_button_up_arrow_128_by_128
            RESOURCE_ARRAY[5] = androidResources.raw.touch_button_down_arrow_128_by_128
            RESOURCE_ARRAY[6] = androidResources.raw.touch_button_turn_left_arrow_128_by_128
            RESOURCE_ARRAY[7] = androidResources.raw.touch_button_turn_right_arrow_128_by_128
            RESOURCE_ARRAY[8] = androidResources.raw.touch_button_strafe_left_arrow_128_by_128
            RESOURCE_ARRAY[9] = androidResources.raw.touch_button_strafe_right_arrow_128_by_128
            if OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan() then
                resourceUtil:addResource(RESOURCE_STRING_ARRAY[3].HINT, tostring(androidResources.raw.ouya_o))
            end
        else
            RESOURCE_ARRAY[1] = androidResources.raw.touch_button_64_by_64
            RESOURCE_ARRAY[2] = androidResources.raw.touch_button_generic_action_64_by_64
            RESOURCE_ARRAY[3] = androidResources.raw.touch_button_start_64_by_64
            RESOURCE_ARRAY[4] = androidResources.raw.touch_button_up_arrow_64_by_64
            RESOURCE_ARRAY[5] = androidResources.raw.touch_button_down_arrow_64_by_64
            RESOURCE_ARRAY[6] = androidResources.raw.touch_button_turn_left_arrow_64_by_64
            RESOURCE_ARRAY[7] = androidResources.raw.touch_button_turn_right_arrow_64_by_64
            RESOURCE_ARRAY[8] = androidResources.raw.touch_button_strafe_left_arrow_64_by_64
            RESOURCE_ARRAY[9] = androidResources.raw.touch_button_strafe_right_arrow_64_by_64
        end
        for index = 0, (RESOURCE_ARRAY.n or #RESOURCE_ARRAY) - 1 do
            resourceUtil:addResource(RESOURCE_STRING_ARRAY[index + 1].RESOURCE, tostring(RESOURCE_ARRAY[index + 1]))
        end
end
java_overload(TouchButtonAndroidResources, "init", 0)

return TouchButtonAndroidResources

