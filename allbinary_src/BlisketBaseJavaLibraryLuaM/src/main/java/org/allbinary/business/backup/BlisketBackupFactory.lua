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
-- package org.allbinary.business.backup

local BlisketBackupFactory = {}
package.loaded["org.allbinary.business.backup.BlisketBackupFactory"] = BlisketBackupFactory

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

local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StoreFrontsEntity = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity")
local StoreFrontsEntityFactory = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local ZipFileUtil = java_lazy("org.allbinary.logic.io.file.zip.ZipFileUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table BlisketBackupFactory is declared before the requires
BlisketBackupFactory.__index = BlisketBackupFactory
BlisketBackupFactory.className = "BlisketBackupFactory"
BlisketBackupFactory.javaClassName = "org.allbinary.business.backup.BlisketBackupFactory"

function BlisketBackupFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.directory = Directory.getInstance()
end

function BlisketBackupFactory._jinit(self)
    BlisketBackupFactory._init_fields(self)
    return self
end

function BlisketBackupFactory.new()
    return BlisketBackupFactory._jinit(setmetatable({}, BlisketBackupFactory))
end


function BlisketBackupFactory.getInstance()
        return BlisketBackupFactory.instance_f
end


-- throws Exception
function BlisketBackupFactory:getFileBasicArrayList(pathString)
        local path = AbPath.new(pathString, self.stringUtil.EMPTY_STRING)
        local file = AbFile.createAbFileFromAbPath(path)
        return self.directory:search(file, true)
end


function BlisketBackupFactory:backup_j0()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backup()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getWebappPath())
            stringBuffer:append(PATH_GLOBALS.getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = self:getFileBasicArrayList(backupPath)
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backup.zip")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
        end
end


function BlisketBackupFactory:backupViews()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backupViews()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getWebappPath())
            stringBuffer:append(PATH_GLOBALS.getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = BasicArrayListD.new()
            local storeFrontsEntity = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            local storeFrontNamesBasicArrayList = storeFrontsEntity:getStoreFrontNames()
            local size = storeFrontNamesBasicArrayList:size()
            local nextStore = nil
            local viewsPath = nil
            for index = 0, size - 1 do
                nextStore = storeFrontNamesBasicArrayList:get(index)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(URLGLOBALS.getWebappPath())
                stringBuffer:append(PATH_GLOBALS.getInstance().VIEWS_PATH)
                stringBuffer:append(nextStore)
                viewsPath = tostring(stringBuffer)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Backup Store Views: ")
                stringBuffer:append(nextStore)
                stringBuffer:append(" from: ")
                stringBuffer:append(viewsPath)
                PreLogUtil.put(tostring(stringBuffer), self, "backupViews()")
                fileBasicArrayList:addAllList(self:getFileBasicArrayList(viewsPath))
            end
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backupViews.zip")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backupViews()", e)
        end
end


function BlisketBackupFactory:backupResources()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backupResources()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getWebappPath())
            stringBuffer:append(PATH_GLOBALS.getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = BasicArrayListD.new()
            local storeFrontsEntity = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            local storeFrontNamesBasicArrayList = storeFrontsEntity:getStoreFrontNames()
            local size = storeFrontNamesBasicArrayList:size()
            local nextStore = nil
            local storeFrontInterface = nil
            local resourcesPath = nil
            for index = 0, size - 1 do
                nextStore = storeFrontNamesBasicArrayList:get(index)
                storeFrontInterface = storeFrontsEntity:getStoreFrontInterface(nextStore)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(URLGLOBALS.getWebappPath())
                stringBuffer:append(storeFrontInterface:getCurrentHostNamePath())
                stringBuffer:append(storeFrontInterface:getCategoryPath())
                resourcesPath = tostring(stringBuffer)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Backup Store Resrouces: ")
                stringBuffer:append(nextStore)
                stringBuffer:append(" from: ")
                stringBuffer:append(resourcesPath)
                PreLogUtil.put(tostring(stringBuffer), self, "backupResources()")
                fileBasicArrayList:addAllList(self:getFileBasicArrayList(resourcesPath))
            end
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backupResources.zip")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backupResources()", e)
        end
end


function BlisketBackupFactory:backupJsps()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backupJsps()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getWebappPath())
            stringBuffer:append(PATH_GLOBALS.getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = BasicArrayListD.new()
            local storeFrontsEntity = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            local storeFrontNamesBasicArrayList = storeFrontsEntity:getStoreFrontNames()
            local size = storeFrontNamesBasicArrayList:size()
            local nextStore = nil
            for index = 0, size - 1 do
                nextStore = storeFrontNamesBasicArrayList:get(index)
                PreLogUtil.put("Backup Store Jsps: " .. nextStore, self, "backupJsps()")
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(URLGLOBALS.getWebappPath())
                stringBuffer:append(nextStore)
                fileBasicArrayList:addAllList(self:getFileBasicArrayList(tostring(stringBuffer)))
            end
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backupJsps.zip")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backupJsps()", e)
        end
end


function BlisketBackupFactory:backup_j2(fileBasicArrayList, zipFile)
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("ZipFile: ")
            stringBuffer:append(zipFile)
            stringBuffer:append(" BasicArrayList: ")
            stringBuffer:appendint(fileBasicArrayList:size())
            PreLogUtil.put("Creating Backup Zip File: " .. tostring(stringBuffer), self, "backup()")
            ZipFileUtil.getInstance():create(zipFile, fileBasicArrayList)
            self.logUtil:putF("Created Backup Zip File", self, "backup()")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
        end
end
function BlisketBackupFactory:backup(...)
    local count = select("#", ...)
    if count == 0 then return self:backup_j0(...) end
    if count == 2 then return self:backup_j2(...) end
    error("No method backup takes " .. count .. " arguments")
end
BlisketBackupFactory.backup__jdispatcher = BlisketBackupFactory.backup

BlisketBackupFactory.instance_f = BlisketBackupFactory.new()

return BlisketBackupFactory

