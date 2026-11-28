-- Generated Code Do Not Modify
-- package org.allbinary.media.graphics.geography.pathfinding

local BasicGeographicMapExtractedPathCacheFactory = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapExtractedPathCacheFactory"] = BasicGeographicMapExtractedPathCacheFactory

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

local BaseBasicArrayListCache = require("org.allbinary.logic.util.cache.BaseBasicArrayListCache")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table BasicGeographicMapExtractedPathCacheFactory is declared before the requires
BasicGeographicMapExtractedPathCacheFactory.__index = BasicGeographicMapExtractedPathCacheFactory
BasicGeographicMapExtractedPathCacheFactory.className = "BasicGeographicMapExtractedPathCacheFactory"
BasicGeographicMapExtractedPathCacheFactory.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapExtractedPathCacheFactory"
setmetatable(BasicGeographicMapExtractedPathCacheFactory, {__index = BaseBasicArrayListCache})

function BasicGeographicMapExtractedPathCacheFactory:_init_fields()
    if self.maxConcurrentPaths == nil then self.maxConcurrentPaths = 0 end
    if self.maxPaths == nil then self.maxPaths = 0 end
end


function BasicGeographicMapExtractedPathCacheFactory.getInstance()
        return BasicGeographicMapExtractedPathCacheFactory.instance_f
end


function BasicGeographicMapExtractedPathCacheFactory._jinit(self)
    java_super_init(BaseBasicArrayListCache, self)
    BasicGeographicMapExtractedPathCacheFactory._init_fields(self)
    return self
end

function BasicGeographicMapExtractedPathCacheFactory.new(...)
    local self = setmetatable({}, BasicGeographicMapExtractedPathCacheFactory)
    BasicGeographicMapExtractedPathCacheFactory._jinit(self, ...)
    return self
end


function BasicGeographicMapExtractedPathCacheFactory:init(maxConcurrentPaths, maxPaths)
        if not rawequal(maxConcurrentPaths, self.maxConcurrentPaths) then
            for index = maxConcurrentPaths, self.maxConcurrentPaths, -1 do
                self.list:add(BasicArrayListS.new(maxPaths))
            end
            self.maxConcurrentPaths = maxConcurrentPaths
        end
        self.maxPaths = maxPaths
end
java_overload(BasicGeographicMapExtractedPathCacheFactory, "init", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function BasicGeographicMapExtractedPathCacheFactory:getPath()
        if self.list:size() > 0 then
            return self.list:removeAt(0)
        else
            return BasicArrayListS.new(self.maxPaths)
        end
end
java_overload(BasicGeographicMapExtractedPathCacheFactory, "getPath", 0)


function BasicGeographicMapExtractedPathCacheFactory:release(list)
        list:clear()
        self.list:add(list)
end
java_overload(BasicGeographicMapExtractedPathCacheFactory, "release", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)

BasicGeographicMapExtractedPathCacheFactory.instance_f = BasicGeographicMapExtractedPathCacheFactory.new()

return BasicGeographicMapExtractedPathCacheFactory

