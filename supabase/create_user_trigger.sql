DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;


create or replace function public.handle_new_user() 
returns trigger as $$
begin
  insert into public.users (user_id, email, username )
  values (new.id, new.email, new.raw_user_meta_data->>'username');
  return new;
end;
$$ language plpgsql security definer;

-- trigger the function every time a user is created
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
