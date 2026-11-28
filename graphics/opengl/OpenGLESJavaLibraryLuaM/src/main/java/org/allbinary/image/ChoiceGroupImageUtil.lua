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
-- package org.allbinary.image

local ChoiceGroupImageUtil = {}
package.loaded["org.allbinary.image.ChoiceGroupImageUtil"] = ChoiceGroupImageUtil

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

local GL = java_lazy("javax.microedition.khronos.opengles.GL")
local ChoiceGroupImageFactory = java_lazy("javax.microedition.lcdui.ChoiceGroupImageFactory")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local PreResourceImageUtil = java_lazy("org.allbinary.image.PreResourceImageUtil")

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

-- class table ChoiceGroupImageUtil is declared before the requires
ChoiceGroupImageUtil.__index = ChoiceGroupImageUtil
ChoiceGroupImageUtil.className = "ChoiceGroupImageUtil"
ChoiceGroupImageUtil.javaClassName = "org.allbinary.image.ChoiceGroupImageUtil"

function ChoiceGroupImageUtil._jinit(self)
    return self
end

function ChoiceGroupImageUtil.new()
    return ChoiceGroupImageUtil._jinit(setmetatable({}, ChoiceGroupImageUtil))
end


function ChoiceGroupImageUtil.getInstance()
        return ChoiceGroupImageUtil.instance_f
end


function ChoiceGroupImageUtil:init()
        local features = Features.getInstance()
        local choiceGroupFactory = ChoiceGroupImageFactory.getInstance()
        local imageArray = choiceGroupFactory:getImageArray()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            local preResourceImageUtil = PreResourceImageUtil.getInstance()
            local size = (imageArray.n or #imageArray)
            for index = 0, size - 1 do
                imageArray[index + 1] = preResourceImageUtil:encapsulate(imageArray[index + 1])
            end
            choiceGroupFactory:init(imageArray)
        end
end


function ChoiceGroupImageUtil:update_j1_1(gl)
        local features = Features.getInstance()
        local choiceGroupFactory = ChoiceGroupImageFactory.getInstance()
        local imageArray = choiceGroupFactory:getImageArray()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            local preResourceImageUtil = PreResourceImageUtil.getInstance()
            local size = (imageArray.n or #imageArray)
            for index = 0, size - 1 do
                preResourceImageUtil:updateGL(gl, imageArray[index + 1])
            end
        end
        choiceGroupFactory:init(imageArray)
end


function ChoiceGroupImageUtil:update_j1_2(graphics)
        local features = Features.getInstance()
        local choiceGroupFactory = ChoiceGroupImageFactory.getInstance()
        local imageArray = choiceGroupFactory:getImageArray()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            local preResourceImageUtil = PreResourceImageUtil.getInstance()
            local size = (imageArray.n or #imageArray)
            for index = 0, size - 1 do
                preResourceImageUtil:update(graphics, imageArray[index + 1])
            end
        end
        choiceGroupFactory:init(imageArray)
end
function ChoiceGroupImageUtil:update(...)
    local count = select("#", ...)
    if count == 1 then return self:update_j1(...) end
    error("No method update takes " .. count .. " arguments")
end
ChoiceGroupImageUtil.update__jdispatcher = ChoiceGroupImageUtil.update
function ChoiceGroupImageUtil:update_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "GL")) then return ChoiceGroupImageUtil.update_j1_1(self, ...) end
    return ChoiceGroupImageUtil.update_j1_2(self, ...)
end

ChoiceGroupImageUtil.instance_f = ChoiceGroupImageUtil.new()

return ChoiceGroupImageUtil

