import * as Yup from 'yup';

export const formSchema = Yup.object({
    meta_title: Yup.string().min(2).max(25).required("Please enter meta_title"),
    meta_tag: Yup.string().min(2).max(25).required("Please enter meta_title"),
    meta_desc: Yup.string().min(2).max(25).required("Please enter meta_title"),
})