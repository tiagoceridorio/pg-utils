CREATE OR REPLACE FUNCTION add_workdays(start_date DATE, num_days INT)
RETURNS DATE AS $$
DECLARE
    end_date DATE := start_date;
    workdays_count INT := 0;
BEGIN
    WHILE workdays_count < num_days LOOP
        end_date := end_date + INTERVAL '1 day';
        IF EXTRACT(ISODOW FROM end_date) < 6 THEN
            workdays_count := workdays_count + 1;
        END IF;
    END LOOP;
    RETURN end_date;
END;
$$ LANGUAGE plpgsql;
