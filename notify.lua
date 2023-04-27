function Notify(title, text, style)
    -- Insert your own notification export here. Title is the subject, Text is the string that is passed on trough the client. Style is the okokNotify way of different icons.
    exports['okokNotify']:Alert(title, text, 5000, style)
end