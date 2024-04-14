import type { User } from '~/types'

const user = ref<User | null>(null);

export const useAppUser = () => {

   
    const supabase_user = useSupabaseUser();
    const supabase = useSupabaseClient<any>();


    const getCustomUser = async () => {
        if (supabase_user.value) {
            const { data, error } = await supabase.from('users').select('*').eq('user_id', supabase_user.value.id).single();
            if (error) {
                throw new Error(error.message);
            }
            user.value = data;
            return data;
        }
    }



    return {
        user,
        getCustomUser,
    }
}