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

local ImageCache = {}
package.loaded["org.allbinary.image.ImageCache"] = ImageCache

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
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local GDResources = java_lazy("org.allbinary.game.gd.resource.GDResources")
local ABSystemWrapper = java_lazy("org.allbinary.logic.ABSystemWrapper")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Memory = java_lazy("org.allbinary.system.Memory")
local ImageCacheBase = require("org.allbinary.image.ImageCacheBase")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table ImageCache is declared before the requires
ImageCache.__index = ImageCache
ImageCache.className = "ImageCache"
ImageCache.javaClassName = "org.allbinary.image.ImageCache"
setmetatable(ImageCache, {__index = ImageCacheBase})

function ImageCache:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function ImageCache._jinit(self)
    java_super_init(ImageCacheBase, self)
    ImageCache._init_fields(self)
    return self
end

function ImageCache.new(...)
    local self = setmetatable({}, ImageCache)
    ImageCache._jinit(self, ...)
    return self
end


function ImageCache:addListener(renderer)
end
java_overload(ImageCache, "addListener", 1)


function ImageCache:getIndex(key)
        local gdResources = GDResources.getInstance()
        local resourceStringArray = gdResources.resourceStringArray
        local size = (resourceStringArray.n or #resourceStringArray)
        for index = 0, size - 1 do
            if rawequal(resourceStringArray[index + 1], key) then
                return index
            end
        end
        self.logUtil:putF(tostring(StringMaker.new():append("unable to find key: "):append(StringUtil.getInstance():toString(key))), self, self.commonStrings.RUN)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(ImageCache, "getIndex", 1)


-- throws Exception
function ImageCache:get(caller, width, height)
        local foundIndex = self:getIndexWH(width, height)
        local image = self:getFromAvailable(foundIndex, width, height)
        if rawequal(image, NullImage.NULL_IMAGE) then
            self.volume = self.volume + (width * height)
            if self.volume > 32000 then
                self.tsUtil:gc()
                self.volume = 0
            end
            image = self:createImage(caller, width, height)
            local widths = self.widths
            if self.nextIndex > (widths.n or #widths) - 1 then
                if rawequal(foundIndex, -1) then
                    foundIndex = self.nextIndex
                    widths[self.nextIndex + 1] = width
                    self.heights[self.nextIndex + 1] = height
                    self.nextIndex = self.nextIndex + 1
                end
                self.listOfList[foundIndex + 1]:add(image)
            end
        end
        return image
end
java_overload(ImageCache, "get", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function ImageCache:getWithKey(key)
        local image = self:getImage(key)
        if rawequal(image, NullImage.NULL_IMAGE) then
            local resourceUtil = ResourceUtil.getInstance()
            local resourceInputStream = resourceUtil:getResourceAsStream(key)
            if rawequal(resourceInputStream, nil) then
                error(require("java.lang.RuntimeException").new(tostring(StringMaker.new():append("Image resource is not available for key: "):append(StringUtil.getInstance():toString(key)))), 0)
            end
            local try_ok, try_error, try_value = pcall(function()
                image = self:createImageFromInputStream(key, resourceInputStream)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put("Exception: Trying Again After GC", self, self.commonStrings.GET, e)
                self.logUtil:putF(tostring(StringMaker.new():append("InputStream: "):append(StringUtil.getInstance():toString(resourceInputStream))), self, self.commonStrings.GET)
                self.tsUtil:gc()
                self.tsUtil:gc()
                self.logUtil:putF(Memory.getInfo(), self, self.commonStrings.GET)
                require("java.lang.Thread").sleep(100)
                image = self:createImageFromInputStream(key, resourceInputStream)
            end
            if J2MEUtil.isHTML() then
            else
                resourceInputStream:close()
            end
            self.hashtable:put(key, image)
        end
        return image
end
java_overload(ImageCache, "getWithKey", 1)


-- throws Exception
function ImageCache:loadImageForAnimation()
end
java_overload(ImageCache, "loadImageForAnimation", 0)


function ImageCache:progressEnded()
end
java_overload(ImageCache, "progressEnded", 0)


function ImageCache:runTask()
end
java_overload(ImageCache, "runTask", 0)


function ImageCache:isLazy()
        return false
end
java_overload(ImageCache, "isLazy", 0)

ImageCache.NULL_IMAGE_CACHE = ImageCache.new()

return ImageCache

