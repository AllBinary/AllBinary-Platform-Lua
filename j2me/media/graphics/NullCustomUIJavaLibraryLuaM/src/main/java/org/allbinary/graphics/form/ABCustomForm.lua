-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

local ABCustomForm = {}
package.loaded["org.allbinary.graphics.form.ABCustomForm"] = ABCustomForm

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local CustomScreen = require("org.allbinary.graphics.form.CustomScreen")

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

-- class table ABCustomForm is declared before the requires
ABCustomForm.__index = ABCustomForm
ABCustomForm.className = "ABCustomForm"
ABCustomForm.javaClassName = "org.allbinary.graphics.form.ABCustomForm"
setmetatable(ABCustomForm, {__index = CustomScreen})

function ABCustomForm:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function ABCustomForm._jinit(self, title, items, backgroundBasicColor, foregroundBasicColor)
    java_super_init(CustomScreen, self)
    ABCustomForm._init_fields(self)
    return self
end

function ABCustomForm.new(...)
    local self = setmetatable({}, ABCustomForm)
    ABCustomForm._jinit(self, ...)
    return self
end


function ABCustomForm:getAllitems()
        return java_new_array(nil, 0)
end
java_overload(ABCustomForm, "getAllitems", 0)


function ABCustomForm:size()
        return 0
end
java_overload(ABCustomForm, "size", 0)


function ABCustomForm:setSelectedIndex(index)
end
java_overload(ABCustomForm, "setSelectedIndex", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ABCustomForm:getSelectedIndex()
        return 0
end
java_overload(ABCustomForm, "getSelectedIndex", 0)


function ABCustomForm:deleteAll()
end
java_overload(ABCustomForm, "deleteAll", 0)


function ABCustomForm:delete(itemNum)
end
java_overload(ABCustomForm, "delete", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ABCustomForm:append(item)
        return -1
end
java_overload(ABCustomForm, "append", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


function ABCustomForm:insert(itemNum, item)
end
java_overload(ABCustomForm, "insert", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) end)


function ABCustomForm:set(itemNum, item)
end
java_overload(ABCustomForm, "set", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) end)


function ABCustomForm:get(itemNum)
        return ABCustomItem.getNullInstance()
end
java_overload(ABCustomForm, "get", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ABCustomForm:getWidth()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(ABCustomForm, "getWidth", 0)


function ABCustomForm:paint(graphics)
end
java_overload(ABCustomForm, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ABCustomForm:getTitle()
        return StringUtil.getInstance().EMPTY_STRING
end
java_overload(ABCustomForm, "getTitle", 0)

return ABCustomForm

