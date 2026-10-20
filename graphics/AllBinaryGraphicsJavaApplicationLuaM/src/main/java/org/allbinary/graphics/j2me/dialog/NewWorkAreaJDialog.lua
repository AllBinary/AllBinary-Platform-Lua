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
-- package org.allbinary.graphics.j2me.dialog

-- local awt = require("java.awt")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local swing = require("javax.swing")
local GraphicsException = require("org.allbinary.graphics.j2me.GraphicsException")
local MyFrame = require("org.allbinary.graphics.j2me.MyFrame")
local WorkAreaJPanel = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local WorkAreaJPanelInterface = require("org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface")
local JDialog = require("org.allbinary.graphics.j2me.dialog.JDialog")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NewWorkAreaJDialog = {}
NewWorkAreaJDialog.__index = NewWorkAreaJDialog
NewWorkAreaJDialog.className = "NewWorkAreaJDialog"
setmetatable(NewWorkAreaJDialog, {__index = JDialog})

function NewWorkAreaJDialog:_init_fields()
    self.parent = nil
    self.dimension = nil
    self.xSizeJTextField = nil
    self.ySizeJTextField = nil
    self.nameJTextField = nil
end


function NewWorkAreaJDialog.new(parent, modal, dimension, newName)
    local self = setmetatable(JDialog.new(parent, modal), NewWorkAreaJDialog)
    self:_init_fields()
        -- super(...) made self above
        local try_ok, try_error = pcall(function()
            self:initComponents()
            self.parent = parent
            self.xSizeJTextField = JTextField.new("12")
            self.ySizeJTextField = JTextField.new("12")
            self.nameJTextField = JTextField.new(newName)
            self.dimension = dimension
            local submitButton = JButton.new("Ok")
            submitButton:addActionListener((function()
                local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
                

                function o:actionPerformed(evt)
                    local try_ok, try_error = pcall(function()
                        self:disposeNewDialog()
                    end)
                    if not try_ok then
                        local e = try_error
                    end
                end
                return o
            end)())
            self:setSize(150, 100)
            self:getContentPane():setLayout(GridLayout.new(5, 2))
            self:getContentPane():add(JLabel.new("Please enter"))
            self:getContentPane():add(JLabel.new(" the size."))
            self:getContentPane():add(JLabel.new("Name:"))
            self:getContentPane():add(self.nameJTextField)
            self:getContentPane():add(JLabel.new("X: "))
            self:getContentPane():add(self.xSizeJTextField)
            self:getContentPane():add(JLabel.new("Y: "))
            self:getContentPane():add(self.ySizeJTextField)
            self:getContentPane():add(submitButton)
            self:show()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
    return self
end


-- throws Exception
function NewWorkAreaJDialog:disposeNewDialog()
        local try_ok, try_error = pcall(function()
            local canvasWidth = self.xSizeJTextField:getText()
            local canvasHeight = self.ySizeJTextField:getText()
            local newName = self.nameJTextField:getText()
            if newName == nil then
                error(GraphicsException.new("No Name", self, "disposeNewDialog"), 0)
            end
            local workAreaJPanel = WorkAreaJPanel.new(newName, self.dimension, math.tointeger(canvasWidth // 1), math.tointeger(canvasHeight // 1))
            workAreaJPanel:setLayout(GridLayout.new(1, 1))
            self.parent:add(workAreaJPanel)
            self:dispose()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


function NewWorkAreaJDialog:initComponents()
        self:addWindowListener((function()
            local o = WindowAdapter.new and WindowAdapter.new() or setmetatable({}, {__index = WindowAdapter})
            

            function o:windowClosing(evt)
                self:closeDialog(evt)
            end
            return o
        end)())
        self:pack()
end


function NewWorkAreaJDialog:closeDialog(evt)
        self:setVisible(false)
        self:dispose()
end


function NewWorkAreaJDialog.main(args)
        local try_ok, try_error = pcall(function()
            NewWorkAreaJDialog.new(MyFrame.new(), true, Dimension.new(100, 100), "testing"):show()
        end)
        if not try_ok then
            local e = try_error
        end
end

return NewWorkAreaJDialog

