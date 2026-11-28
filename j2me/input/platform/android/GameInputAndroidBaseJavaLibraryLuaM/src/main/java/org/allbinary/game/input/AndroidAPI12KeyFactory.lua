-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local AndroidAPI12KeyFactory = {}
package.loaded["org.allbinary.game.input.AndroidAPI12KeyFactory"] = AndroidAPI12KeyFactory

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

local KeyEvent = java_lazy("android.view.KeyEvent")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local AndroidAPI9KeyFactory = require("org.allbinary.game.input.AndroidAPI9KeyFactory")
local AndroidGameKey = java_lazy("org.allbinary.game.input.AndroidGameKey")

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

-- class table AndroidAPI12KeyFactory is declared before the requires
AndroidAPI12KeyFactory.__index = AndroidAPI12KeyFactory
AndroidAPI12KeyFactory.className = "AndroidAPI12KeyFactory"
AndroidAPI12KeyFactory.javaClassName = "org.allbinary.game.input.AndroidAPI12KeyFactory"
setmetatable(AndroidAPI12KeyFactory, {__index = AndroidAPI9KeyFactory})


function AndroidAPI12KeyFactory.getAPI12Instance()
        if rawequal(AndroidAPI12KeyFactory.instance12, NullUtil.getInstance().NULL_OBJECT) then
            AndroidAPI12KeyFactory.instance12 = AndroidAPI12KeyFactory.new()
        end
        return AndroidAPI12KeyFactory.instance12
end


function AndroidAPI12KeyFactory._jinit(self)
    java_super_init(AndroidAPI9KeyFactory, self)
        self.KEYCODE_BUTTON_1 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_1, "BUTTON 1")
        self.KEYCODE_BUTTON_10 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_10, "BUTTON 10")
        self.KEYCODE_BUTTON_11 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_11, "BUTTON 11")
        self.KEYCODE_BUTTON_12 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_12, "BUTTON 12")
        self.KEYCODE_BUTTON_13 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_13, "BUTTON 13")
        self.KEYCODE_BUTTON_14 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_14, "BUTTON 14")
        self.KEYCODE_BUTTON_15 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_15, "BUTTON 15")
        self.KEYCODE_BUTTON_16 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_16, "BUTTON 16")
        self.KEYCODE_BUTTON_2 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_2, "BUTTON 2")
        self.KEYCODE_BUTTON_3 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_3, "BUTTON 3")
        self.KEYCODE_BUTTON_4 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_4, "BUTTON 4")
        self.KEYCODE_BUTTON_5 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_5, "BUTTON 5")
        self.KEYCODE_BUTTON_6 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_6, "BUTTON 6")
        self.KEYCODE_BUTTON_7 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_7, "BUTTON 7")
        self.KEYCODE_BUTTON_8 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_8, "BUTTON 8")
        self.KEYCODE_BUTTON_9 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_9, "BUTTON 9")
    return self
end

function AndroidAPI12KeyFactory.new(...)
    local self = setmetatable({}, AndroidAPI12KeyFactory)
    AndroidAPI12KeyFactory._jinit(self, ...)
    return self
end

AndroidAPI12KeyFactory.instance12 = NullUtil.getInstance().NULL_OBJECT

return AndroidAPI12KeyFactory

