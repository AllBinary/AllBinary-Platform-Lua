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
-- package org.allbinary.logic.io.file.directory

local DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor = {}
package.loaded["org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor"] = DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor

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

local GitProcessHelper = java_lazy("org.allbinary.java.runtime.process.git.GitProcessHelper")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local CommonDataFileStrings = java_lazy("org.allbinary.logic.io.file.CommonDataFileStrings")
local IncludeFileExtensionsBooleanFileVisitor = require("org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TrackedStrings = java_lazy("org.allbinary.logic.io.file.directory.TrackedStrings")

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

-- class table DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor is declared before the requires
DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.__index = DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor
DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.className = "DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor"
DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.javaClassName = "org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor"
setmetatable(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor, {__index = IncludeFileExtensionsBooleanFileVisitor})

function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:_init_fields()
    self.trackedStrings = TrackedStrings.getInstance()
    self.gitProcessHelper = GitProcessHelper.getInstance()
    if self.includesString == nil then self.includesString = nil end
end

function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new1(self, ...)
    elseif count == 2 then return DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new2(self, ...)
    end
    error("No constructor of DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor takes " .. count .. " arguments")
end

function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(...)
    local self = setmetatable({}, DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor)
    DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._jinit(self, ...)
    return self
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new1(self, filterStringBasicArrayList)
    java_super_init(IncludeFileExtensionsBooleanFileVisitor, self, filterStringBasicArrayList)
    DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._init_fields(self)
        -- super(...) made self above
        self.includesString = nil
    return self
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new2(self, filterStringBasicArrayList, includesString)
    java_super_init(IncludeFileExtensionsBooleanFileVisitor, self, filterStringBasicArrayList)
    DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._init_fields(self)
        -- super(...) made self above
        self.includesString = includesString
    return self
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:visit_j1(file)
        if file:isDirectory() then
            return true
        end
        if rawequal(self.includesString, nil) or file:getAbsolutePath():indexOf(self.includesString) >= 0 then
            return java_super(IncludeFileExtensionsBooleanFileVisitor, "visit", 1)(self, file)
        else
            return false
        end
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:visit_j2(file, fileNameString)
        local filePath = file:getPath()
        if java_super(IncludeFileExtensionsBooleanFileVisitor, "visit", 2)(self, file, fileNameString) then
            if not ((string.find(filePath, self.trackedStrings.APPLICATION, 1, true) ~= nil) or (string.find(filePath, self.trackedStrings.APP, 1, true) ~= nil) or (string.find(filePath, self.trackedStrings.HTML_TEMP, 1, true) ~= nil)) then
                if not ((string.find(filePath, self.trackedStrings.TARGET_PATH_WINDOWS, 1, true) ~= nil) or (string.find(filePath, self.trackedStrings.TARGET_PATH_UNIX, 1, true) ~= nil)) then
                    if self.gitProcessHelper:isTracked(file) then
                        return true
                    else
                    end
                else
                end
            else
            end
        end
        return false
end
function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:visit(...)
    local count = select("#", ...)
    if count == 1 then return self:visit_j1(...) end
    if count == 2 then return self:visit_j2(...) end
    local parent = getmetatable(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor).__index
    if parent.visit then return parent.visit(self, ...) end
    error("No method visit takes " .. count .. " arguments")
end
DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.visit__jdispatcher = DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.visit


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.main(args)
        local commonFileStrings = CommonDataFileStrings.getInstance()
        local list = BasicArrayListD.new()
        list:add(commonFileStrings.JAVA)
        local filePath = "G:\\mnt\\bc\\mydev\\games\\ZeptoRacer\\platform\\j2se\\ZeptoRacerStaticPathsJ2SEM\\target\\dependency\\org\\allbinary\\logic\\system\\security\\licensing\\ZeptoRacerPCClientInformation.java"
        local result = DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(list):visit(AbFile.createAbFileFromRawPath(filePath))
        print(require("allbinary_java").to_string(require("allbinary_java").to_string(filePath) .. require("allbinary_java").to_string(" is Tracked: ")) .. require("allbinary_java").to_string(result))
end

return DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor

