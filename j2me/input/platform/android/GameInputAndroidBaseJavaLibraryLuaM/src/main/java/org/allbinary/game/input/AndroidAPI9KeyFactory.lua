-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local AndroidAPI9KeyFactory = {}
package.loaded["org.allbinary.game.input.AndroidAPI9KeyFactory"] = AndroidAPI9KeyFactory

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
local AndroidKeyFactory = require("org.allbinary.game.input.AndroidKeyFactory")
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

-- class table AndroidAPI9KeyFactory is declared before the requires
AndroidAPI9KeyFactory.__index = AndroidAPI9KeyFactory
AndroidAPI9KeyFactory.className = "AndroidAPI9KeyFactory"
AndroidAPI9KeyFactory.javaClassName = "org.allbinary.game.input.AndroidAPI9KeyFactory"
setmetatable(AndroidAPI9KeyFactory, {__index = AndroidKeyFactory})


function AndroidAPI9KeyFactory.getInstance()
        if AndroidAPI9KeyFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            AndroidAPI9KeyFactory.instance_f = AndroidAPI9KeyFactory.new()
        end
        return AndroidAPI9KeyFactory.instance_f
end


function AndroidAPI9KeyFactory._jinit(self)
    java_super_init(AndroidKeyFactory, self)
        self.KEYCODE_BUTTON_L1 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_L1, "BUTTON L1")
        self.KEYCODE_BUTTON_R1 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_R1, "BUTTON R1")
        self.KEYCODE_BUTTON_THUMBR = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_THUMBR, "BUTTON THUMBR")
        self.KEYCODE_BUTTON_THUMBL = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_THUMBL, "BUTTON THUMBL")
        self.KEYCODE_BUTTON_START = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_START, "BUTTON START")
        self.KEYCODE_BUTTON_MODE = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_MODE, "BUTTON MODE")
        self.KEYCODE_BUTTON_B = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_B, "BUTTON B")
        self.KEYCODE_BUTTON_A = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_A, "BUTTON A")
        self.KEYCODE_BUTTON_X = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_X, "BUTTON X")
        self.KEYCODE_BUTTON_Y = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_Y, "BUTTON Y")
        self.KEYCODE_BUTTON_L2 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_L2, "BUTTON L2")
        self.KEYCODE_BUTTON_R2 = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_R2, "BUTTON R2")
        self.KEYCODE_BUTTON_SELECT = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_SELECT, "BUTTON SELECT")
        self.KEYCODE_BUTTON_C = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_C, "BUTTON C")
        self.KEYCODE_BUTTON_Z = AndroidGameKey.new(KeyEvent.KEYCODE_BUTTON_Z, "BUTTON Z")
    return self
end

function AndroidAPI9KeyFactory.new(...)
    local self = setmetatable({}, AndroidAPI9KeyFactory)
    AndroidAPI9KeyFactory._jinit(self, ...)
    return self
end

AndroidAPI9KeyFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return AndroidAPI9KeyFactory

