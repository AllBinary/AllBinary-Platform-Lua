-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local ImageFactory = {}
package.loaded["org.allbinary.image.ImageFactory"] = ImageFactory

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

local InputStream = java_lazy("java.io.InputStream")
local Image = java_lazy("javax.microedition.lcdui.Image")

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

--ImageCacheBaseAndroidJavaLibrary
-- class table ImageFactory is declared before the requires
ImageFactory.__index = ImageFactory
ImageFactory.className = "ImageFactory"
ImageFactory.javaClassName = "org.allbinary.image.ImageFactory"

function ImageFactory._jinit(self)
    return self
end

function ImageFactory.new()
    return ImageFactory._jinit(setmetatable({}, ImageFactory))
end


function ImageFactory.getInstance()
        return ImageFactory.instance_f
end


-- throws Exception
function ImageFactory:createImageUrl(url)
        return Image.createImage(url)
end


-- throws Exception
function ImageFactory:createImage(caller, width, height)
        return Image.createImageWH(width, height)
end


-- throws Exception
function ImageFactory:createImageFromInputStream_j2(key, inputStream)
        local image = Image.createImageFromInputStream(inputStream)
        return image
end


-- throws Exception
function ImageFactory:createImageFromInputStream_j1(inputStream)
        return Image.createImageFromInputStream(inputStream)
end
function ImageFactory:createImageFromInputStream(...)
    local count = select("#", ...)
    if count == 2 then return self:createImageFromInputStream_j2(...) end
    if count == 1 then return self:createImageFromInputStream_j1(...) end
    error("No method createImageFromInputStream takes " .. count .. " arguments")
end
ImageFactory.createImageFromInputStream__jdispatcher = ImageFactory.createImageFromInputStream

ImageFactory.instance_f = ImageFactory.new()

return ImageFactory

