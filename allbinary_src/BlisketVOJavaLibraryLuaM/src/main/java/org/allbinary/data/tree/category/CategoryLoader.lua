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
-- package org.allbinary.data.tree.category

local CategoryLoader = {}
package.loaded["org.allbinary.data.tree.category.CategoryLoader"] = CategoryLoader

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

local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = java_lazy("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local CategoryProperties = java_lazy("org.allbinary.business.category.properties.CategoryProperties")
local CategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CategoryModifierTree = require("org.allbinary.data.tree.category.CategoryModifierTree")
local CategoryLoaderInterface = require("org.allbinary.data.tree.category.CategoryLoaderInterface")

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

-- class table CategoryLoader is declared before the requires
CategoryLoader.__index = CategoryLoader
CategoryLoader.className = "CategoryLoader"
CategoryLoader.javaClassName = "org.allbinary.data.tree.category.CategoryLoader"
setmetatable(CategoryLoader, {__index = CategoryModifierTree})
CategoryLoader.java_implements = " CategoryLoaderInterface "
CategoryLoader.java_interfaces = function() return {CategoryLoaderInterface} end

function CategoryLoader:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CategoryLoader._jinit(self, categoryFactoryInterface)
    java_super_init(CategoryModifierTree, self, categoryFactoryInterface)
    CategoryLoader._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.START, self, "CategoryLoader(CategoryFactoryInterface categoryFactoryInterface)")
        end
    return self
end

function CategoryLoader.new(...)
    local self = setmetatable({}, CategoryLoader)
    CategoryLoader._jinit(self, ...)
    return self
end


function CategoryLoader:getDoc(categoryInterface)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(categoryInterface:getProperties():getPath(categoryInterface:getHierarchy()), nil) then
                if rawequal(categoryInterface:getHierarchy():getLevel(), 1) then
                    local rootAbFile = AbFile.createAbFileFromAbPath(categoryInterface:getRootFilePath())
                    if not (rootAbFile:isDirectory()) then
                        rootAbFile:mkdirs()
                        if not (rootAbFile:isDirectory()) then
                            error(require("java.lang.Exception").new("Could Not Create Directory"), 0)
                        end
                        self:save(categoryInterface)
                    end
                end
                local fileAbPath = categoryInterface:getFilePath()
                local cryptFileReader = CryptFileReader.new(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION)
                local document = DomDocumentHelper.create(cryptFileReader:get(fileAbPath))
                do return "__jreturn", document end
            else
                error(require("java.lang.Exception").new("Null Category"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                local try_ok, try_error, try_value = pcall(function()
                    categoryInterface:log()
                end)
                if not try_ok then
                    local e2 = try_error
                    if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                    self.logUtil:put("Could Not Log Category", self, "getDoc", e)
                end
                self.logUtil:put(self.commonStrings.FAILURE, self, "getDoc", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryLoader, "getDoc", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) end)


function CategoryLoader:get_j1_1(categoryInterface)
        local try_ok, try_error, try_value = pcall(function()
            local document = self:getDoc(categoryInterface)
            local categoryNode = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document:getChildNodes())
            do return "__jreturn", self:addProperties(categoryInterface, categoryNode:getChildNodes()) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function CategoryLoader:get_j1_2(document)
        local try_ok, try_error, try_value = pcall(function()
            local categoryNode = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document:getChildNodes())
            local loadedCategoryInterface = self.categoryFactoryInterface:getRootInstanceFromNode(categoryNode)
            do return "__jreturn", self:addProperties(loadedCategoryInterface, categoryNode:getChildNodes()) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function CategoryLoader:get(...)
    local count = select("#", ...)
    if count == 1 then return self:get_j1(...) end
    local parent = getmetatable(CategoryLoader).__index
    if parent.get then return parent.get(self, ...) end
    error("No method get takes " .. count .. " arguments")
end
CategoryLoader.get__jdispatcher = CategoryLoader.get
function CategoryLoader:get_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) then return CategoryLoader.get_j1_1(self, ...) end
    return CategoryLoader.get_j1_2(self, ...)
end


function CategoryLoader:getAll_j1_1(categoryInterface)
        local try_ok, try_error, try_value = pcall(function()
            local document = self:getDoc(categoryInterface)
            do return "__jreturn", self:getAll(document) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function CategoryLoader:getAll_j1_2(document)
        local try_ok, try_error, try_value = pcall(function()
            local categoryNode = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document:getChildNodes())
            local loadedCategoryInterface = self.categoryFactoryInterface:getRootInstanceFromNode(categoryNode)
            do return "__jreturn", self:addProperties(loadedCategoryInterface, categoryNode:getChildNodes()) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function CategoryLoader:getAll_j2(parentCategoryInterface, categoryNodeList)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(categoryNodeList, nil) then
                for index = 0, categoryNodeList:getLength() - 1 do
                    local categoryNode = categoryNodeList:item(index)
                    if not rawequal(categoryNode, nil) and rawequal(categoryNode:getNodeName():compareTo(CategoryData.getInstance().NAME), 0) then
                        local categoryInterface = self.categoryFactoryInterface:getInstance(parentCategoryInterface:getHierarchy():getRoot(), parentCategoryInterface, categoryNode)
                        parentCategoryInterface:addChild(categoryInterface)
                    end
                end
            end
            do return "__jreturn", parentCategoryInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function CategoryLoader:getAll(...)
    local count = select("#", ...)
    if count == 1 then return self:getAll_j1(...) end
    if count == 2 then return self:getAll_j2(...) end
    local parent = getmetatable(CategoryLoader).__index
    if parent.getAll then return parent.getAll(self, ...) end
    error("No method getAll takes " .. count .. " arguments")
end
CategoryLoader.getAll__jdispatcher = CategoryLoader.getAll
function CategoryLoader:getAll_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) then return CategoryLoader.getAll_j1_1(self, ...) end
    return CategoryLoader.getAll_j1_2(self, ...)
end


function CategoryLoader:addProperties(loadedCategoryInterface, categoryNodeList)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(categoryNodeList, nil) then
                for index = 0, categoryNodeList:getLength() - 1 do
                    local categoryNode = categoryNodeList:item(index)
                    if not rawequal(categoryNode, nil) and rawequal(categoryNode:getNodeName():compareTo(CategoryData.getInstance().NAME), 0) then
                        local categoryPropertiesInterface = CategoryProperties.new(categoryNode)
                        loadedCategoryInterface:addChildProperty(categoryPropertiesInterface)
                    end
                end
            end
            do return "__jreturn", loadedCategoryInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryLoader, "addProperties", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) and (java_a2 == nil or java_is(java_a2, "NodeList")) end)

return CategoryLoader

